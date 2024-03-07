#include <stdio.h>
#include <alloc.h>

int main(int argc, char argv[])
{
    mm_init();
    return 1;

    int* arr = mm_malloc(sizeof(int) * 10);
    printf("hehe\n");
}
