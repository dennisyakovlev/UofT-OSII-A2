#include <stdio.h>
#include <alloc.h>

#include <stdlib.h>
#include <string.h>

typedef struct hash_table_node
{
    short     M_used;
    int       M_key;
    void*     M_data;
}
node;

typedef struct S1
{
    char* data;
}
s1;

int main(void)
{

    mm_init();
    return 1;
}
