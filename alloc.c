#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <stddef.h>
#include <string.h>
#include <immintrin.h>
#include <stdio.h>
#include <assert.h>

#include "memlib.h"
#include "alloc.h"

struct memory_block_collection;
struct memory_block_manager;

typedef struct memory_block_manager block_manager;


// -------------------------------  Vector Begin            -------------------------------

int32_t vector_find_int(int32_t toFind, int32_t * from)
{
//__m256i arr8 = _mm256_lddqu_si256((__m256i *)from);
//__m256i num8 = _mm256_set1_epi32(toFind);
//
//__m256i cmp = _mm256_cmpeq_epi32(arr8, num8);
//__m256 cmp_ps = _mm256_castsi256_ps(cmp);
//int mask = _mm256_movemask_ps(cmp_ps);
//return _tzcnt_u32(mask);

    for (int i=0;i<8;i++)
    {
        if (toFind == from[i]) {
            return i;
        }
    }
    return 8;
}

///**
// * Find the first 1 bit in a 256 bit bitset
// * @param m256i the bitset to search
// * @return index of the first 1 bit, or 256 if no 1 bit is found
// */
//inline int vector_find_first_1_bit(const __m256i* m256i)
//{
//    __m256i cmp = _mm256_cmpeq_epi32(*m256i, _mm256_setzero_si256()); // compare with zero to find the first non-zero 32bit group
//    uint8_t zero_mask = _mm256_movemask_ps(_mm256_castsi256_ps(cmp)); // mask of zero 32bit groups
//    uint8_t nonzero_mask = ~ zero_mask; // bitwise not the mask, 1 means non-zero 32bit group in the bitset
//
//    if (nonzero_mask == 0)
//    {
//        return 256;  // none of the groups have 1, so all bits are zero in the bitset
//    }
//
//    uint32_t idx_first_1_group = _tzcnt_u32(nonzero_mask);  // first non-zero 32bit group
//    uint32_t first_1_group = ((uint32_t*)m256i)[idx_first_1_group];  // get the first non-zero 32bit group
//    uint32_t idx_first_1 = _tzcnt_u32(first_1_group);  // find the first 1 in the first non-zero 32bit group
//    return 32 * idx_first_1_group + idx_first_1;  // combine the index
//}

int find_first_0_bit(const uint32_t num)
{
    for (int j = 0; j < 32; j++)
    {
        if ((num & (1 << j)) >> j == 0)
        {
            return j;
        }
    }

    return 32;
}

int vector_find_first_0_bit(const uint32_t *m256)
{
//    __m256i inverted_bitset = ~ _mm256_lddqu_si256((const __m256i*)m256); // invert the bitset to find the first 1
//    int result = vector_find_first_1_bit(&inverted_bitset);
//    return result;
    for (int i=0;i<8;i++)
    {
        for (int j=0;j<32;j++)
        {
            if ((m256[i] & ( 1 << j )) >> j == 0)
            {
                return i * 32 + j;
            }
        }
    }

    return 256;
}

/**
 * Find the first element in the array that is greater than or equal to the number
 * @param array Array of 8 32 bit integers
 * @param num The number to compare with
 * @return The index of the first element in the array which is >= num, or >=8 if no such element exists
 */
int vector_find_first_gte(const int32_t* array, int32_t num)
{
//    __m256i sizes = _mm256_lddqu_si256((__m256i *)array);
//    __m256i num8 = _mm256_set1_epi32(num - 1);  // minus one to deal with gte
//
//    __m256i result = _mm256_cmpgt_epi32(sizes, num8);
//    __m256 cmp_ps = _mm256_castsi256_ps(result);
//    int mask = _mm256_movemask_ps(cmp_ps);
//    uint32_t trail = _tzcnt_u32(mask);
//    return trail;
    for (int i=0;i<8;i++)
    {
        if (array[i] >= num) {
            return i;
        }
    }
    return 8;
}

// -------------------------------  Vector End              -------------------------------

// -------------------------------  Hash Table Begin        -------------------------------

/**
 * a probabilistic hash table that uses fixed seperate chaining
 */
typedef struct fast_hash_table
{
    int32_t    M_sz;
    int32_t*   M_keys;
    char**     M_values;
} hash_table;

/**
 * hash function taken from internet
 * https://stackoverflow.com/questions/664014/what-integer-hash-function-are-good-that-accepts-an-integer-hash-key
 */
int32_t table_hash(hash_table* table, int32_t x)
{
    x = ((x >> 16) ^ x) * 0x45d9f3b;
    x = ((x >> 16) ^ x) * 0x45d9f3b;
    x = (x >> 16) ^ x;
    return 1 + (x % table->M_sz);
}

int32_t table_need(int32_t sz)
{
    return sizeof(hash_table) + ((8 * sz) * sizeof(int32_t)) + ((8 * sz) + sizeof(char*));
}

void table_init(hash_table* table, int32_t sz)
{
    /*
        layout of table in memory is
        M_sz         number of keys
        M_keys       (point to p1)
        M_values     (p2)
        keys start   (p1)
        ...
        values start (p2)
        ...
    */

    const int32_t key_sz = sizeof(int32_t) * (8 * sz);
    table->M_sz          = sz;
    table->M_keys        = (int32_t*)((char*)table + sizeof(hash_table));
    table->M_values      = (char**)((char*)table + sizeof(hash_table) + key_sz);

    memset(table->M_keys, 0, key_sz);
}

void* table_lookup(hash_table* table, int32_t k)
{
    int32_t hashed = table_hash(table, k);
    int32_t found  = vector_find_int(k, table->M_keys + (hashed*8));

    return found >= 8 ? NULL : (table->M_values + hashed*8)[found];
}

void table_insert(hash_table* table, int32_t k, void* data)
{
    int32_t hashed = table_hash(table, k);
//    fprintf(stderr, "hash(%d)=%d\n", k, hashed);
    int32_t found  = vector_find_int(k, table->M_keys + (hashed*8));

    if (found >= 8) // inserting new key
        found = vector_find_int(0, table->M_keys + (hashed*8));
    assert(0 <= found && found < 8);

    (table->M_keys + hashed*8)[found]   = k;
    (table->M_values + hashed*8)[found] = (char*)data;
}

void table_remove(hash_table* table, int32_t k)
{
    int32_t hashed = table_hash(table, k);
    int32_t found  = vector_find_int(k, table->M_keys + (hashed*8));
    assert(0 <= found && found < 8);

    (table->M_keys + hashed*8)[found]   = 0;
    (table->M_values + hashed*8)[found] = NULL;
}

void table_free(void)
{
    assert(1);
}

// -------------------------------  Hash Table End          -------------------------------

#define BLOCK_NUM_TYPES 8
const int32_t BLOCK_SZ[8]  = {8,32,128,512,2048,16384,131072,1048576};
//const int32_t BITSET_SZ[8] = {8,8, 8,  8,   4,    1,     1,      1};
pthread_mutex_t sbrk_mutex;


// -------------------------------  Block Collection Begin  -------------------------------
//region Block Collection

/**
a block collection is a contiguous set of memory where
    - the first sizeof(block_collection)] bytes are the meta
    - next (sizeof(void*) + M_blk_sz) * M_nblk bytes are M_nblks
*/
typedef struct memory_block_collection
{
    uint32_t  M_bitset;
    int32_t   M_blk_sz;    // the block size
    uint32_t  M_num_free;  // number of free blocks in this collection
    struct memory_block_collection
            *M_next,      // next collection in list, NULL is end
    *M_prev;      // previous collection in list
    struct memory_block_manager
            *M_owner;
}
        block_collection;

/**
 * The metadata we store right before each memory block
 */
typedef struct memory_block
{
    block_collection* M_start; // start of block collection
} block;

void collection_init(block_collection* collection, block_manager* owner, int32_t block_sz)
{
//    assert(1<=bitset_sz && bitset_sz<=8);

    collection->M_bitset    = 0;
    collection->M_blk_sz    = block_sz;
    collection->M_num_free  = 32;
    collection->M_next      = NULL;
    collection->M_prev      = NULL;
    collection->M_owner     = owner;
}

//inline __attribute__ ((always_inline))
int32_t collection_needed(int32_t blk_sz)
{

    assert(blk_sz != 0);
//    if (bitset_sz==0 || blk_sz==0)
//    {
//        assert(bitset_sz==0 && blk_sz==0);
//        return 0;
//    }

//    assert(1<=bitset_sz && bitset_sz<=8);

    return sizeof(block_collection) + ((sizeof(block) + blk_sz) * 32);
}

/**
 * find the first block size for which sz is >= to
 */
int32_t collection_find_type(int32_t sz)
{
    if (sz > BLOCK_SZ[BLOCK_NUM_TYPES - 1]) {
        // To large
        // TODO large blocks special case
        fprintf(stderr, "SIZE TOO LARGE!!! %d REQUESTED\n", sz);
        return -1;
    }

    int32_t type = vector_find_first_gte(BLOCK_SZ, sz);

    assert(type < BLOCK_NUM_TYPES);

    return type;
}

/**
 * allocate a block from the collection and return start of
 * block. if full, return NULL
 */
void* collection_allocate(block_collection* collection)
{
//    uint32_t index = vector_find_first_0_bit(collection->M_bitset);

    uint32_t index = find_first_0_bit(collection->M_bitset);

    if (index >= 32)
    {
        assert(collection->M_num_free == 0);
        return NULL;
    }

    assert(collection->M_num_free != 0);


    collection->M_bitset  |= 1 << index;
    collection->M_num_free             -= 1;

    char* blk_start = (char*)collection + sizeof(block_collection); // first block metadata
    char* blk = blk_start + (index * (collection->M_blk_sz + sizeof(block))); // allocated block metadata
    ((block*)blk)->M_start = collection;
    return blk + sizeof(block); // after metadata
}

block_collection* collection_from_ptr(void* ptr)
{
    char* blk = (char*)ptr - sizeof(block);
    return ((block*)blk)->M_start;
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
    assert(blk_index < 32);
    collection->M_bitset &= ~(1 << blk_index);
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
    block_collection*            M_mids[BLOCK_NUM_TYPES];  // the boundary between have room and not have room
    block_collection*            M_tails[BLOCK_NUM_TYPES]; // the last node of each list
    uint32_t                     M_num[BLOCK_NUM_TYPES];   // currently held of each collection type
    struct memory_block_manager* M_next;
    pthread_mutex_t              M_lock;
}
        block_manager;

void manager_init(block_manager* manager)
{
    assert(pthread_mutex_init(&manager->M_lock, NULL) == 0);
}

/**
 * insert a new block collection into the corresponding list of type after
 * the after collection. if after is NULL, insert new as head
 */
void manager_insert(block_manager* manager, block_collection* after, uint32_t type, block_collection* node)
{
    assert(after != node);
    assert(node->M_prev == NULL);
    assert(node->M_next == NULL);

    manager->M_num[type] += 1;
    node->M_owner = manager;

    if (after != NULL)
    {
        node->M_next = after->M_next;
        if (after->M_next != NULL) // after is not tail
            after->M_next->M_prev = node;
        else // after is tail
            manager->M_tails[type] = node;
        after->M_next = node;
    }
    else // insert new head
    {
        if (manager->M_tails[type] == NULL) // first node in list
        {
            manager->M_tails[type] = node;

            assert(node->M_num_free != 0); //should never insert a free collection as the head

            manager->M_mids[type] = node;
        }
        else
            manager->M_heads[type]->M_prev = node;
        node->M_next = manager->M_heads[type];
        manager->M_heads[type] = node;
    }
    node->M_prev = after;

    if (after == manager->M_mids[type] && node->M_num_free != 0)
        manager->M_mids[type] = node;
}

/**
 * erase a node currently located within a manager list of type
 */
void manager_erase(block_manager* manager, uint32_t type, block_collection* node)
{
    assert(node->M_owner == manager);

    manager->M_num[type] -= 1;

    block_collection* prev = node->M_prev;
    block_collection* next = node->M_next;

    if (prev != NULL) // not head
        prev->M_next = next;
    else              // head
        manager->M_heads[type] = next;

    if (next != NULL) // not tail
        next->M_prev = prev;
    else              // tail
        manager->M_tails[type] = prev;

    if (manager->M_mids[type] == node)
        manager->M_mids[type] = prev;

    node->M_prev  = NULL;
    node->M_next  = NULL;
    node->M_owner = NULL;
}

void manager_lock(block_manager* manager)
{
    pthread_mutex_lock(&manager->M_lock);
}

void manager_unlock(block_manager* manager)
{
    pthread_mutex_unlock(&manager->M_lock);
}

//endregion
// -------------------------------  Block Manager End       -------------------------------

// -------------------------------  Global Allocator Start  -------------------------------
//region Global Allocator

block_manager allocator;

/**
 * structure to give to allocator on request
 */
typedef struct memory_collection_info
{
//    int32_t  M_bitset_sz;
//    int32_t  M_blk_sz;
    int32_t  type;
    int32_t  M_num;       // number of this collection wanted
}
        collection_info;

/**
 * forcefully allocate memory from OS and put it into given manager
 * the collection will be inserted as the head
 */
int allocator_force_take_collection(block_manager* into, collection_info req)
{
    size_t size = collection_needed(BLOCK_SZ[req.type]) * req.M_num;

    pthread_mutex_lock(&sbrk_mutex);
    char* ptr = (char*)mem_sbrk(size);
    pthread_mutex_unlock(&sbrk_mutex);
    if (ptr == NULL) return 1;

    // init the blocks, give to into
    const int32_t collection_sz = collection_needed(BLOCK_SZ[req.type]);
    for (int32_t j = 0; j != req.M_num; ++j, ptr += collection_sz)
    {
        collection_init((block_collection*)ptr, into, BLOCK_SZ[req.type]);
        manager_insert(into, NULL, req.type, (block_collection *) ptr);
    }

    return 0;
}

/**
 * request collections using the info struct from the global allocator.
 * the collection requested will be set as the head of
 * the list in the into, with any free collections being taken from global
 *
 * Note: <into> should be already locked
 *
 * @param into
 * @param req
 * @return
 */
int allocator_take_collection(block_manager *into, collection_info req)
{
    // TODO: maybe skipped list approximation optimization

    uint32_t type = req.type;

    manager_lock(&allocator);
    // take any available collections from global
    for (; req.M_num != 0 && allocator.M_num[type] != 0;)
    {
        block_collection *head = allocator.M_heads[type];
        manager_erase(&allocator, type, head);
        manager_insert(into, NULL, type, head);

        req.M_num -= 1;
    }
    manager_unlock(&allocator);

    if (req.M_num == 0)
    {
        // we are done
        return 0;
    }

    // any block collections that from doesn't already have should
    // be requested from the OS
    int ret = allocator_force_take_collection(into, req);
    return ret;
}

/**
 * return a block collection back to global
 * it must not belong to any managers
 * Note: global allocator will be locked by this function
 */
void allocator_return_collection_to_global(block_collection* collection, uint32_t type)
{
    assert(collection->M_owner == NULL);
    manager_lock(&allocator);
    // insert block collection at start
    manager_insert(&allocator, NULL, type, collection);
    manager_unlock(&allocator);
}

/**
 * allocate new memory for some managers and put them into
 * the global allocator
 */
int allocator_force_take_manager(uint32_t num)
{
    const size_t wanted     = sizeof(block_manager) * num;
    pthread_mutex_lock(&sbrk_mutex);
    block_manager* managers = (block_manager*)mem_sbrk(wanted);
    pthread_mutex_unlock(&sbrk_mutex);
    if (managers == NULL)
    {
        return -1;
    }

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
    manager_lock(&allocator);

    if (allocator.M_next==NULL && allocator_force_take_manager(4) != 0)
        return NULL;

    block_manager* manager = allocator.M_next;
    allocator.M_next       = manager->M_next;
    manager->M_next        = NULL;

    manager_unlock(&allocator);

    return manager;
}

/**
 * give a manager back to the global available ones
 */
void allocator_give_manager(block_manager* manager)
{
    manager_lock(&allocator);

    assert(manager->M_next==NULL);
    assert(manager!=&allocator);

    manager->M_next  = allocator.M_next;
    allocator.M_next = manager;

    manager_unlock(&allocator);
}

//endregion
// -------------------------------  Global Allocator End    -------------------------------


/**
 * NOTE: instead of moving "has blocks" to front, move "full" to back
 * since moving has block to front, on next search will need to go back to where the moved
 * block was.
 *
 * alloc -> full send to back
 * free -> full to not full -> insert it behind the last non-full collection
 *
 * when alloc in serial
 *
 * if (first collection is full) => need more mem
 * else just allocate into the first collection
 * @param sz size of memory to allocate
 * @return pointer to the allocated memory, NULL if OOM
 */
void* serial_allocate(block_manager* manager, size_t sz)
{
    // find the block head with a good size
    const int32_t type = collection_find_type(sz);
    if (type < 0) return NULL;
    // TODO type == -1 special case

    manager_lock(manager);

    block_collection* collection = manager->M_heads[type];

    assert((collection == NULL) == (manager->M_num[type] == 0));

    // no collection available or
    // last available collection is about to be full
    //      collection = mid => mid is head => last not full block left
    if (collection == NULL || (collection->M_num_free == 1 && collection == manager->M_mids[type]))
    {
        // all nodes are full or the head is NULL
        collection_info req;
        req.type     = type;
        req.M_num    = 1;

        // allocate a new node, it will be placed at the head
        int result = allocator_take_collection(manager, req);
        if (result != 0) {
            return NULL;
        }

        if (collection == NULL)
            collection = manager->M_heads[type];
    }

    assert(collection != NULL);

    //find the first free block in this node
    void* ptr = collection_allocate(collection);
    assert(ptr != NULL);

    // check if it is full
    if (collection->M_num_free == 0)
    {
        if (collection == manager->M_mids[type])
        {
            manager->M_mids[type] = collection->M_prev;
        }

        if (collection != manager->M_tails[type])
        {
            // move it to the end
            manager_erase(manager, type, collection);
            manager_insert(manager, manager->M_tails[type], type, collection);
        }
    }

    manager_unlock(manager);

    return ptr;
}

void serial_free(void* ptr)
{
    block_collection* collection = collection_from_ptr(ptr);
    block_manager* manager       = collection->M_owner;

    manager_lock(manager);

    collection_free(ptr);

    if (collection->M_num_free == 1)
    {
        assert(collection->M_bitset != 0);
        // if collection is now not full, move to end of not fulls
        const int32_t type = collection_find_type(collection->M_blk_sz);
        if (manager->M_mids[type] != collection)
        {
            manager_erase(manager, type, collection);
            manager_insert(manager, manager->M_mids[type], type, collection);
        }
    }

    if (collection->M_bitset == 0)
    {
        assert(collection->M_num_free > 1);
        // this collection is completely empty, we should give it back to global
        const int32_t type = collection_find_type(collection->M_blk_sz);
        manager_erase(manager, type, collection);
        manager_unlock(manager);

        //return the memory
        allocator_return_collection_to_global(collection, type);
        return;
    }

    manager_unlock(manager);
}

hash_table* G_table;

void *mm_malloc(size_t sz)
{
    pthread_t tid = pthread_self();
//    fprintf(stderr, "Thread %lu allocating %lu\n", tid, sz);
    block_manager* manager = (block_manager*) table_lookup(G_table, tid);

    if (manager == NULL)
    {
        manager = allocator_take_manager();
        table_insert(G_table, pthread_self(), manager);
    }
    assert(manager);

    return serial_allocate(manager, sz);
}

void mm_free(void *ptr)
{
    serial_free(ptr);
}

int mm_init(void)
{
    int init_res = mem_init();
    if (init_res != 0) {
        return init_res;
    }

    pthread_mutex_init(&sbrk_mutex, NULL);

    G_table = (hash_table*)mem_sbrk(table_need(32));
    table_init(G_table, 32);

    manager_init(&allocator);

//    collection_info req;
////    req[1].M_bitset_sz = BITSET_SZ[1];
//    req.type    = 2;
//    req.M_num   = 8;
//    allocator_force_take_collection(&allocator, req);

    allocator_force_take_manager(16);

//    block_manager* manager = allocator_take_manager();
//    table_insert(G_table, pthread_self(), manager);

    return 0;
}

