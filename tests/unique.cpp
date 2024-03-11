#include <iostream>
#include <cassert>
#include <set>
#include <vector>
#include <alloc.h>
#include <tests.h>

using namespace std;

void unique_1()
{
    // pointer returns should be unique

    set<void*> st;
    for (int i=0; i!=10000; ++i)
    {
        for (int j=1; j<50000; j*=2)
        {
            void* ptr = mm_malloc(j);
            assert(st.find(ptr) == end(st));
            cout << i << " " << j << endl;
            st.insert(ptr);
        }
    }
}

void unique_2()
{
    // pointer ranges should not overlap

    vector<pair<char*,char*>> v; // (start, end)
    for (int i=0; i!=10000; ++i)
    {
        char* ptr = (char*)mm_malloc(1000);
        auto [b,e] = make_pair(ptr, ptr+1000);
        for (auto [l,r] : v)
        {
            if (l<=b) assert(r<b);
            if (e<=r) assert(e<l);
        }
        v.push_back({b,e});
    }
}

void unique_3()
{
    // pointer returns should be unique with frees

    set<void*> st;
    for (int i=0; i!=100000; ++i)
    {
        for (int j=1; j<50000; j*=2)
        {
            void* ptr = mm_malloc(j);
            assert(st.find(ptr) == end(st));
            st.insert(ptr);
        }

        if (i%2500==0) while (size(st))
        {
            mm_free(*begin(st));
            st.erase(begin(st));
        }
    }
}

void unique_4()
{
    // pointer ranges should not overlap with frees

    vector<pair<char*,char*>> v; // (start, end)
    for (int i=0; i!=10000; ++i)
    {
        char* ptr = (char*)mm_malloc(1000);
        auto [b,e] = make_pair(ptr, ptr+1000);
        for (auto [l,r] : v)
        {
            if (l<=b) assert(r<b);
            if (e<=r) assert(e<l);
        }
        v.push_back({b,e});

        while (size(v))
        {
            mm_free(v.back().first);
            v.pop_back();
        }
    }
}

void run_unique()
{
    unique_1();
    unique_2();
    unique_3();
    unique_4();

    cout << "UNIQUE OKAY" << endl;
}
