#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <stddef.h>
#include <alloc.h>
#include <string.h>

#include <immintrin.h>

#include <assert.h>

// -------------------------------  Vector Instructions Begin  ----------------------------
//region Vector Instructions

int32_t vector_find_int(int32_t toFind, int32_t * from)
{
    __m256i arr8 = _mm256_load_si256((__m256i *)from);
    __m256i num8 = _mm256_set1_epi32(toFind);

    __m256i cmp = _mm256_cmpeq_epi32(arr8, num8);
    __m256 cmp_ps = _mm256_castsi256_ps(cmp);
//    int mask = _mm256_movemask_ps(cmp_ps);
//    int res = 8-1-_tzcnt_u32(mask);
}

/**
 * Find the first 1 bit in a 256 bit bitset
 * @param m256i the bitset to search
 * @return index of the first 1 bit, or 256 if no 1 bit is found
 */
static inline __attribute__((always_inline)) int vector_find_first_1_bit(const __m256i* m256i)
{
    __m256i cmp = _mm256_cmpeq_epi32(*m256i, _mm256_setzero_si256()); // compare with zero to find the first non-zero 32bit group
    uint8_t zero_mask = _mm256_movemask_ps(_mm256_castsi256_ps(cmp)); // mask of zero 32bit groups
    uint8_t nonzero_mask = ~ zero_mask; // bitwise not the mask, 1 means non-zero 32bit group in the bitset

    if (nonzero_mask == 0)
    {
        return 256;  // none of the groups have 1, so all bits are zero in the bitset
    }

    uint32_t idx_first_1_group = _tzcnt_u32(nonzero_mask);  // first non-zero 32bit group
    uint32_t first_1_group = ((uint32_t*)m256i)[idx_first_1_group];  // get the first non-zero 32bit group
    uint32_t idx_first_1 = _tzcnt_u32(first_1_group);  // find the first 1 in the first non-zero 32bit group
    return 32 * idx_first_1_group + idx_first_1;  // combine the index
}

static inline __attribute__((always_inline)) int vector_find_first_0_bit(const void *m256)
{
    __m256i inverted_bitset = ~ _mm256_lddqu_si256((const __m256i*)m256); // invert the bitset to find the first 1
    int result = vector_find_first_1_bit(&inverted_bitset);
    return result;
}

/**
 * Find the first element in the array that is greater than or equal to the number
 * @param array Array of 8 32 bit integers
 * @param num The number to compare with
 * @return The index of the first element in the array which is >= num, or 8 if no such element exists
 */
static inline __attribute__((always_inline)) int vector_find_first_gte(int32_t* array, int32_t num)
{
    __m256i sizes = _mm256_lddqu_si256((__m256i *)array);
    __m256i num8 = _mm256_set1_epi32(num - 1);  // minus one to deal with gte

    __m256i result = _mm256_cmpgt_epi32(sizes, num8);
    __m256 cmp_ps = _mm256_castsi256_ps(result);
    int mask = _mm256_movemask_ps(cmp_ps);
    uint32_t trail = _tzcnt_u32(mask);
    return trail;
}

//endregion
// -------------------------------  Vector Instructions End   -----------------------------

// -------------------------------  Hash Table Begin        -------------------------------
//region Hash Table

#define HASH_TABLE_INUSE 8
#define HASH_TABLE_FREE  9
typedef int table_key;

typedef struct hash_table_node
{
    short     M_used;
    table_key M_key;
    void*     M_data;
}
table_node;

typedef struct fast_hash_table
{
    int         M_sz;
    table_node* M_arr;
}
hash_table;

int table_need(int sz)
{
    return sizeof(table_node) * sz + sizeof(hash_table);
}

void table_init(hash_table* tbl, int sz)
{
    tbl->M_sz  = sz;
    tbl->M_arr = (table_node*)((char*)tbl + sizeof(hash_table));
    for (int i=0; i!=sz; ++i) tbl->M_arr[i].M_used = HASH_TABLE_FREE;
}

void* table_lookup(hash_table* tbl, table_key k)
{
    for (int i=0;i!=tbl->M_sz;++i)
    {
        if (tbl->M_arr[i].M_key == k && tbl->M_arr[i].M_used == 1) return tbl->M_arr[i].M_data;
    }
    return NULL;
}

void table_insert(hash_table* tbl, table_key k, void* data)
{
    assert(tbl->M_arr[k].M_used == HASH_TABLE_FREE);

    tbl->M_arr[k].M_used = HASH_TABLE_INUSE;
    tbl->M_arr[k].M_key  = k;
    tbl->M_arr[k].M_data = data;
}

void table_remove(hash_table* tbl, table_key k)
{
    assert(tbl->M_arr[k].M_used == HASH_TABLE_INUSE);

    memset(tbl->M_arr + k, 0, sizeof(table_node)); // defensive
    tbl->M_arr[k].M_used = HASH_TABLE_FREE;
}

void table_free(void)
{
}

//endregion
// -------------------------------  Hash Table End          -------------------------------



#define BLOCK_NUM_TYPES 8
const ptrdiff_t BLOCK_SZ[8]  = {8,64,256,1024,16384,262144,4194304,67108864};
const ptrdiff_t BITSET_SZ[8] = {8,8, 8,  8,   4,    1,     1,      1};



// -------------------------------  Block Collection Begin  -------------------------------
//region Block Collection

/**
a block collection is a contiguous set of memory where
    - the first sizeof(block_collection)] bytes are the meta
    - next (sizeof(void*) + M_blk_sz) * M_nblk bytes are M_nblks
*/
typedef struct memory_block_collection
{
    uint32_t  M_bitset[8];
    uint32_t  M_bitset_sz; // range of [1,8], have 32*bitset_sz blocks
    ptrdiff_t M_blk_sz;    // the block size
    uint32_t  M_num_free;  // number of free blocks in this collection
    struct memory_block_collection
             *M_next,      // next collection in list, NULL is end
             *M_prev;      // previous collection in list
}
block_collection;

/**
 * The metadata we store right before each memory block
 */
typedef struct memory_block
{
    block_collection* M_start; // start of block collection
}
block;

void collection_init(void* mem, uint32_t bitset_sz, ptrdiff_t block_sz)
{
    assert(1<=bitset_sz && bitset_sz<=8);

    block_collection* collection = (block_collection*)mem;

    memset(collection->M_bitset, 0, sizeof(uint32_t) * 8);
    collection->M_bitset_sz = bitset_sz;
    collection->M_blk_sz    = block_sz;
    collection->M_num_free  = 32 * bitset_sz;
    collection->M_next      = NULL;
    collection->M_prev      = NULL;
}

//inline __attribute__ ((always_inline))
size_t collection_needed(uint32_t bitset_sz, ptrdiff_t blk_sz)
{
    if (bitset_sz==0 || blk_sz==0)
    {
        assert(bitset_sz==0 && blk_sz==0);
        return 0;
    }

    assert(1<=bitset_sz && bitset_sz<=8);

    return sizeof(block_collection) + ((sizeof(void*) + blk_sz) * 32*bitset_sz);
}

/**
 * find the first block size for which sz is >= to
 */
int32_t collection_find_type(int32_t sz)
{
    int32_t i = 0;
    for (; sz>BLOCK_SZ[i]; ++i);
    return i;
}

/**
 * find a free block if it exists
 */
int32_t collection_have_free_block(block_collection* collection)
{
    for (int32_t i=0; i!=BLOCK_NUM_TYPES; ++i)
    {
        for (int32_t j=31; j!=-1; --j)
        {
            if ((collection->M_bitset[i] & (1 << j))==0) return 32*i + (31-j);
        }
    }

    return 256 + 1;
}

/**
 * allocate a block from the collection and return start of
 * block. if full, return NULL
 */
void* collection_allocate(block_collection* collection)
{
    uint32_t blk_index = collection_have_free_block(collection);

    if (blk_index > 256)
        return NULL;

    collection->M_bitset[blk_index/32] |= 1 << (31 - (blk_index%32));
    collection->M_num_free             -= 1;

    char* blk_start = (char*)collection + sizeof(block_collection); // first block metadata
    char* blk = blk_start + (blk_index * (collection->M_blk_sz + sizeof(block))); // allocated block metadata
    ((block*)blk)->M_start = collection;
    return  blk + sizeof(block); // after metadata
}

/**
 * free a pointer from a collection
 */
void collection_free(void* ptr)
{
    char* blk = (char*)ptr - sizeof(block);
    block_collection* collection = ((block*)blk)->M_start;
    char* blk_start = (char*)collection + sizeof(block_collection);
    uint32_t blk_index = (blk - blk_start) / (sizeof(block) + collection->M_blk_sz);

    collection->M_bitset[blk_index/32] &= ~(1 << (31 - (blk_index%32)));
    collection->M_num_free             += 1;
}

//endregion
// -------------------------------  Block Collection End    -------------------------------

// -------------------------------  Block Manager Begin     -------------------------------
// region Block Manager

/**
contains lists of different block allocation sizes

the thread which owns the manager has exclusive access to
    all collections within the manager's lists
*/
typedef struct memory_block_manager
{
    block_collection*            M_heads[BLOCK_NUM_TYPES]; // heads of lists to held collection type
    block_collection*            M_sep[BLOCK_NUM_TYPES];   // the last node in a list that still has space
    uint32_t                     M_num[BLOCK_NUM_TYPES];   // currently held of each collection type
    struct memory_block_manager* M_next;
    pthread_mutex_t              M_lock;
}
block_manager;

void manager_init(block_manager* manager)
{
    pthread_mutex_init(&manager->M_lock, NULL);
}

/**
 * insert a new block collection into the corresponding list of type after
 * the after collection. if after is NULL, insert new as head
 */
void manager_insert(block_manager* manager, block_collection* after, uint32_t type, block_collection* insert)
{
    manager->M_num[type] += 1;

    if (after==NULL) // insert to head
    {
        block_collection* next = manager->M_heads[type];
        manager->M_heads[type] = insert;
        insert->M_next         = next;
        if (next) next->M_prev = insert;
        return;
    }

    block_collection* next = after->M_next;
    block_collection* prev = after->M_prev;

    insert->M_next            = next;
    insert->M_prev            = prev;
    if (next) next->M_prev    = insert; // tail
    prev->M_next              = insert;
}

/**
 * erase a node currently located within a manager list of type
 */
void manager_erase(block_manager* manager, uint32_t type, block_collection* node)
{
    manager->M_num[type] -= 1;

    // head
    if (node==manager->M_heads[type])
    {
        manager->M_heads[type] = node->M_next;

        node->M_prev = NULL;
        node->M_next = NULL;
        return;
    }

    block_collection* prev = node->M_prev;
    block_collection* next = node->M_next;

    prev->M_next           = next;
    if (next) next->M_prev = prev;

    node->M_next = NULL;
    node->M_prev = NULL;
}

void manager_lock(block_manager* manager)
{
}

void manager_unlock(block_manager* manager)
{

}

//endregion
// -------------------------------  Block Manager End       -------------------------------

// -------------------------------  Global Allocator Start  -------------------------------
//region Global Allocator

block_manager allocator;

/**
structure to give to allocator on request

*/
typedef struct memory_collection_info
{
    uint32_t  M_bitset_sz;
    ptrdiff_t M_blk_sz;
    uint32_t  M_num;       // number of this collection wanted
}
collection_info;

/**
 * forcefully allocate memory from OS and put it into given manager
 */
int allocator_force_take_collection(block_manager* into, collection_info* req, size_t size)
{
    if (size==0)
    {
        for (uint32_t type=0; type!=BLOCK_NUM_TYPES; ++type)
        {
            assert(req[type].M_bitset_sz==0 || req[type].M_bitset_sz==BITSET_SZ[type]);
            assert(req[type].M_blk_sz==0 || req[type].M_blk_sz==BLOCK_SZ[type]);

            size+=collection_needed(req[type].M_bitset_sz, req[type].M_blk_sz) * req[type].M_num;
        }
    }

    char* ptr = (char*)malloc(size);
    if (!ptr) return 1;

    // init the blocks, give to into
    for (uint32_t type=0; type!=BLOCK_NUM_TYPES; ++type)
    {
        const ptrdiff_t collection_sz = collection_needed(req[type].M_bitset_sz, req[type].M_blk_sz);
        for (uint32_t j=0; j!=req[type].M_num; ++j, ptr+=collection_sz)
        {
            collection_init(ptr, req[type].M_bitset_sz, req[type].M_blk_sz);
            manager_insert(into, NULL, type, (block_collection*)ptr);
        }
    }

    return 0;
}

/**
request collections using the info struct from the global allocator. there are BLOCK_NUM_TYPES
    info structs. the lists of collections corresponding to request will be set as the head of
    the corresponding lists in the into, with any free collections being taken from from
*/
int allocator_take_collection(block_manager* into, collection_info* req)
{
    // TODO: maybe skipped list approximation optmization

    size_t size=0;
    for (uint32_t type=0; type!=BLOCK_NUM_TYPES; ++type)
    {
        // add any collections already have in from to into
        for (; req[type].M_num!=0 && allocator.M_num[type]!=0;)
        {
            block_collection* head = allocator.M_heads[type];
            manager_erase(&allocator, type, head);
            manager_insert(into, NULL, type, head);

            req[type].M_num -= 1;
        }

        // any block collections that from doesn't already have should
        // be requested from the OS
        size+=collection_needed(req[type].M_bitset_sz, req[type].M_blk_sz) * req[type].M_num;
    }

    if (size==0) return 0; // from had all requested blocks

    return allocator_force_take_collection(into, req, size);
}

/**
 * return to allocator a list of collections. must be same sizes.
 * end of list must point to null
 */
int allocator_give_collection(block_manager* manager, block_collection* collection)
{
    // insert block collection at start
    // need to conver to index
    for (uint32_t type=0; type!=BLOCK_NUM_TYPES; ++type)
    {
        if (collection->M_blk_sz==BLOCK_SZ[type])
        {
            block_collection* next = manager->M_heads[type];
            manager->M_heads[type] = collection;
            manager->M_heads[type]->M_next = next;
            return 0;
        }
    }

    return 1;
}

int allocator_force_take_manager(uint32_t num)
{
    const size_t wanted     = sizeof(block_manager) * num;
    block_manager* managers = (block_manager*)malloc(wanted);
    memset(managers, 0, wanted);

    for (uint32_t i=0; i!=num; ++i, ++managers)
    {
        manager_init(managers);
        managers->M_next  = allocator.M_next;
        allocator.M_next  = managers;
    }

    return 0;
}

/**
 * take a manager from the available global ones or allocate
 * some new somes.
 */
block_manager* allocator_take_manager(void)
{
    if (allocator.M_next==NULL && allocator_force_take_manager(4))
        return NULL;

    block_manager* manager = allocator.M_next;
    allocator.M_next       = manager->M_next;
    manager->M_next        = NULL;

    return manager;
}

/**
 * give a manager back to the global available ones
 */
void allocator_give_manager(block_manager* manager)
{
    assert(manager->M_next==NULL);

    manager->M_next  = allocator.M_next;
    allocator.M_next = manager;
}

//endregion
// -------------------------------  Global Allocator End    -------------------------------

/*
   NOTE: instead of moving "has blocks" to front, move "full" to back
   since moving has block to front, on next search will need to go back to where the moved
   block was.

   alloc -> full send to back
   free -> full to not full -> send to front

   when alloc in serial
   if (first collection is full) => need more mem
   else just allocate into the first collection
*/

void* serial_allocate(size_t sz)
{
    /*

     // find the block head with a good size
    if (sz > BLOCK_SZ[BLOCK_NUM_TYPES - 1]) {
        // To large
        // TODO large blocks special case
        return NULL;
    }

    // TODO: use vector instructions
    uint32_t type = 0;
    for (;type < BLOCK_NUM_TYPES; type++)
    {
        if (sz <= BLOCK_SZ[type]) {
            // found it
            break;
        }
    }

    // find a node with free blocks
//    block_collection* prev = NULL;
//    block_collection* curr = manager->M_heads[type];
//    while (curr != NULL && curr->M_num_free > 0)
//    {
//        prev = curr;
//        curr = curr->M_next;
//    }
//
//    block_collection* collection = curr;
//    if (curr == NULL || prev == NULL)
    block_collection* collection = manager->M_heads[type];
    if (collection == NULL || collection->M_num_free == 0)
    {
//        // all nodes are full or the head is NULL
//        collection_info req[]
//        // allocate a new node, it will be placed at the head
//        int result = allocator_take_collection(manager, );
//        if (result != 0) {
//            return NULL;
//        }
//        collection = manager->M_heads[type];
    }

    //find the first free block in this node
    //TODO: use vector instructions






     */

    const uint32_t type = collection_find_type(sz);
    if (allocator.M_num[type] == 0 || allocator.M_heads[type]->M_num_free == 0)
    {
        collection_info req[8] = {0};
        req[type].M_bitset_sz  = BITSET_SZ[type];
        req[type].M_blk_sz     = BLOCK_SZ[type];
        req[type].M_num        = 8;
        allocator_force_take_collection(&allocator, req, 0);
    }

    return collection_allocate(allocator.M_heads[type]);
}

void serial_free(void* ptr)
{
    collection_free(ptr);
}

hash_table* G_table;

void *mm_malloc(size_t sz)
{
    return serial_allocate(sz);

// get block manager for this thread
// get block_manager from hashmap using tid
// find corresponding block size for allocation
// check all the block collections
// found -> update bit set, set M_start and return
// else take from allocator

	(void)sz; /* Avoid warning about unused variable */
	return NULL;
}

void mm_free(void *ptr)
{
    collection_free(ptr);
}

int mm_init(void)
{
    G_table = (hash_table*)malloc(table_need(32));
    table_init(G_table, 32);

    manager_init(&allocator);

    collection_info req[BLOCK_NUM_TYPES] = {0};
    req[1].M_bitset_sz = BITSET_SZ[1];
    req[1].M_blk_sz    = BLOCK_SZ[1];
    req[1].M_num       = 8;
    allocator_force_take_collection(&allocator, req, 0);

    //block_manager* manager = allocator_take_manager();
    //table_insert(G_table, 0, manager);

    //req[0].M_bitset_sz = BITSET_SZ[1];
    //req[0].M_blk_sz    = BLOCK_SZ[1];
    //req[0].M_num       = 1;
    //allocator_take_collection(manager, req);

	return 0;
}

