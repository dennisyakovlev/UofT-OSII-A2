//#include <pthread.h>
//#include <assert.h>
//#include <stdlib.h>

//#include <emmintrin.h>
#include <stdio.h>
#include <immintrin.h>

/*
void* init(void* arg)
{
    int i=0,j=rand()%10000000;
    while (i++!=j);
}

int main2(int argc, char argv[])
{
    const int nthreads = 24;
    pthread_t tids[nthreads];
    for (int i=0;i!=nthreads;++i) assert(!pthread_create(tids+i,NULL,init,NULL));
    for (int i=0;i!=nthreads;++i)
    {
        printf("%ld %ld ",tids[i],tids[i]/8392704);
        if (i) printf("%ld",tids[i-1]-tids[i]);
        printf("\n");
        assert(!pthread_join(tids[i],NULL));
    }
}
*/

int vec_index(__m128i arr, __m128i look_for) 
{
    __m128i cmp = _mm_cmpeq_epi8(arr, look_for);
    int mask = _mm_movemask_epi8(cmp);
    return _tzcnt_u32(mask);
}

int main()
{
    __m128i arr = _mm_setr_epi8(0,1,2,7,4,5,6,3,8,9,10,11,12,13,14,15);
    __m128i num = _mm_set1_epi8(20);
    printf("%d\n", vec_index(arr,num));


    // 8, 32 bit numbers
    __m256i arr8 = _mm256_set_epi32(2356634,453,7,7,7,8,9876365,10);
    __m256i num8 = _mm256_set1_epi32(9);

    __m256i cmp = _mm256_cmpeq_epi32(arr8, num8);
    __m256 cmp_ps = _mm256_castsi256_ps(cmp);
    int mask = _mm256_movemask_ps(cmp_ps);
    int res = 8-1-_tzcnt_u32(mask);
    printf("%d\n", res);
}

