#include <stdio.h>
#include <alloc.h>

#include <stdlib.h>
#include <string.h>

void test1(void)
{
    const int sz = 50;
    int* arr = (int*)mm_malloc(sizeof(int) * sz);
    for (int i=0; i!=sz; ++i) arr[i]=i;
    for (int i=0; i!=sz; ++i) printf("%d ", arr[i]);
    printf("\n");
}

void test2(void)
{
    const int times = 37;
    for (int i=0; i!=8*256*times; ++i)
    {
        int* ptr = (int*)mm_malloc(sizeof(int));
        *ptr = i;
        printf("%d ", *ptr);
    }
}

void test3(void)
{
    int* ptr = (int*)mm_malloc(sizeof(int));
    *ptr = 3871;
    mm_free(ptr);
}

void test4(void)
{

}

int main(void)
{
    mm_init();

    test3();

    return 1;
}
