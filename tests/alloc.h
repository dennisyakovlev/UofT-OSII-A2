#include <stdint.h>
#include <stddef.h>

void* mm_malloc(size_t sz);

void mm_free(void* ptr);

int mm_init(void);

