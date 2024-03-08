#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <stddef.h>
#include <alloc.h>
#include <string.h>

#include <assert.h>

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
    void*     M_next;      // next collection in list, NULL is end
    void*     M_prev;      // previous collection in list
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

    block_collection* collection = mem;

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

<<<<<<< HEAD
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
            if (collection->M_bitset[i] & (1 << j)) return 32*i + (31-j);
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

    char* blk_start = (char*)collection + sizeof(collection); // first block metadata
    char* blk = blk_start + (blk_index * (collection->M_blk_sz + sizeof(block))) - sizeof(block);
    ((block*)blk)->M_start = collection;
    return  blk + 1; // after metadata
}

void collection_free(void* ptr)
{
    char* blk = (char*)ptr - sizeof(block);
    block_collection* collection = ((block*)blk)->M_start;
    char* blk_start = (char*)collection + sizeof(collection);
    uint32_t blk_index = (blk - blk_start) / (sizeof(block) + collection->M_blk_sz);

    collection->M_bitset[blk_index/32] &= ~(1 << (31 - (blk_index%32)));
}

=======
//endregion
>>>>>>> 318379b98a58a836ebf4454445d8f37c8b26d01d
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
void manager_insert(block_manager* manager, block_collection* after, uint32_t type, block_collection* new)
{
    manager->M_num[type] += 1;

    if (after==NULL)
    {
        block_collection* next = manager->M_heads[type]==NULL ? NULL : manager->M_heads[type]->M_next;
        manager->M_heads[type] = new;
        new->M_next            = next;
        return;
    }

    block_collection* next = after->M_next;
    block_collection* prev = after->M_prev;

    new->M_next  = next;
    new->M_prev  = prev;
    next->M_prev = new;
    prev->M_next = new;
}

/**
 * erase a node currently located within a manager list of type
 */
void manager_erase(block_manager* manager, uint32_t type, block_collection* node)
{
    // edge case for head
    if (node==manager->M_heads[type])
    {
        manager->M_heads[type] = node->M_next;
        return;
    }

    block_collection* prev = manager->M_heads[type]->M_prev;
    block_collection* next = manager->M_heads[type]->M_next;

    prev->M_next = next;
    next->M_prev = prev;

    node->M_next = NULL;
    node->M_prev = NULL;

    manager->M_num[type] -= 1;
}

<<<<<<< HEAD
void manager_lock(block_manager* manager)
{
}

void manager_unlock(block_manager* manager)
{
    
}

=======
//endregion
>>>>>>> 318379b98a58a836ebf4454445d8f37c8b26d01d
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

    char* ptr = malloc(size);
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
    block_manager* managers = malloc(wanted);
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
	(void)ptr; /* Avoid warning about unused variable */
}

int mm_init(void)
{
    G_table = malloc(table_need(32));
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

