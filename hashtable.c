#include "hashtable.h"

#include <string.h>
#include <assert.h>

#include "intrinsics.h"

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