#include <stdint.h>

#ifndef A2TEMP_HASHTABLE_H
#define A2TEMP_HASHTABLE_H

#define HASH_TABLE_INUSE 8
#define HASH_TABLE_FREE  9

/**
 * a probabilistic hash table that uses fixed seperate chaining
 */
typedef struct fast_hash_table
{
    int32_t    M_sz;
    int32_t*   M_keys;
    char**     M_values;
}
        hash_table;

int32_t table_hash(hash_table* table, int32_t x);

int32_t table_need(int32_t sz);

void table_init(hash_table* table, int32_t sz);

void* table_lookup(hash_table* table, int32_t k);

void table_insert(hash_table* table, int32_t k, void* data);

void table_remove(hash_table* table, int32_t k);

void table_free(void);




#endif //A2TEMP_HASHTABLE_H
