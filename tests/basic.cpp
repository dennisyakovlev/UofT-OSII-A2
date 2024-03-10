#include <iostream>
#include <vector>
#include <alloc.h>
#include <tests.h>

using namespace std;

void basic_1()
{
    int* ptr = (int*)mm_malloc(sizeof(int));
    *ptr = 7;
    mm_free(ptr);
}

void basic_2()
{
    // allocate different size array, set their values, free them

    for (int i=1; i<1000000; i+=10000)
    {
        int* ptr = (int*)mm_malloc(sizeof(int) * i);
        for (int j=0; j!=i; ++j) ptr[j]=i;
        mm_free(ptr);
    }
}

void basic_3()
{
    // allocate alloc ints at once, set values then free. do this 850 times

    const int alloc=1000;
    for (int i=0; i!=850; ++i)
    {
        vector<int*> v(alloc);
        for (int j=0; j!=alloc; ++j) v[j]=(int*)mm_malloc(sizeof(int)), *v[j]=97;
        for (int j=0; j!=alloc; ++j) mm_free(v[j]);
    }
}

void run_basic()
{
    //basic_1();
    //basic_2();
    basic_3();

    printf("BASIC OKAY\n");
}
