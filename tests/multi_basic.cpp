#include <iostream>
#include <mutex>
#include <atomic>
#include <thread>
#include <vector>
#include <map>
#include <alloc.h>
#include <cassert>

using namespace std;

atomic<bool> ab;

void tfunc_1(vector<int*>& v)
{
    while (atomic_load(&ab)==false);
    for (int i=0; i!=int(size(v)); ++i) v[i]=(int*)mm_malloc(sizeof(int)), *v[i]=i+int(size(v));
}

void multibasic_1()
{
    // run two threads, store numbers in a vector for each thread

    atomic_store(&ab,false);
    vector<int*> v1(1000003), v2(1000007);
    thread t1(tfunc_1, ref(v1)), t2(tfunc_1, ref(v2));
    atomic_store(&ab,true);
    t1.join(), t2.join();

    for (int i=0; i!=int(size(v1)); ++i) assert(*v1[i] == int(size(v1))+i);
    for (int i=0; i!=int(size(v2)); ++i) assert(*v2[i] == int(size(v2))+i);
}

void tfunc_2(vector<int>& freq)
{
    while (atomic_load(&ab)==false);
    int** arr = (int**)mm_malloc(sizeof(int) * 5000);
    for (int i=0; i!=10000; ++i)
    {
        for (int j=0; j!=5000; ++j) arr[j]=(int*)mm_malloc(sizeof(int)), *arr[j]=j;
        for (int j=0; j!=5000; ++j) ++freq[*arr[j]];
        for (int j=0; j!=5000; ++j) mm_free(arr[j]);
    }
}

void multibasic_2()
{
    // run n threads, allocate x integers, add each appearence in map, free each int
    // the frequency on each [0,x] should be the same in each map 

    atomic_store(&ab,false);
    const int nthread=2;
    vector<thread> vt(nthread);
    vector<vector<int>> vm(nthread, vector<int>(5000));
    for (int i=0; i!=nthread; ++i) vt.emplace(begin(vt)+i, thread(tfunc_2, ref(vm[i])));
    atomic_store(&ab,true);
    for (int i=0; i!=nthread; ++i) vt[i].join();

    for (int i=0; i!=5000; ++i)
    {
        int freq = vm[0][i];
        for (int j=0; j!=nthread; ++j) assert(freq == vm[j][i]);
    }
}

void run_multibasic()
{
    // multibasic_1();
    multibasic_2();

    cout << "MULTI BASIC OKAY" << endl;
}

