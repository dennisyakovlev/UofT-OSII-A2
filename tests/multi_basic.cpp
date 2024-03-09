#include <iostream>
#include <mutex>
#include <atomic>
#include <thread>
#include <vector>
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
    atomic_store(&ab,false);
    vector<int*> v1(1000003), v2(1000007);
    thread t1(tfunc_1, ref(v1)), t2(tfunc_1, ref(v2));
    atomic_store(&ab,true);
    t1.join(), t2.join();

    for (int i=0; i!=int(size(v1)); ++i) assert(*v1[i] == int(size(v1))+i);
    for (int i=0; i!=int(size(v2)); ++i) assert(*v2[i] == int(size(v2))+i);
}

void run_multibasic()
{
    multibasic_1();

    cout << "MULTI BASIC OKAY" << endl;
}

