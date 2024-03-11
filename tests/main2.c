#include <stdio.h>
#include <immintrin.h>
#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

int32_t vector_find_int(int32_t toFind, int32_t * from)
{
    __m256i arr8 = _mm256_lddqu_si256((__m256i *)from);
    __m256i num8 = _mm256_set1_epi32(toFind);

    __m256i cmp = _mm256_cmpeq_epi32(arr8, num8);
    __m256 cmp_ps = _mm256_castsi256_ps(cmp);
    int mask = _mm256_movemask_ps(cmp_ps);
    return _tzcnt_u32(mask);
}

int vector_find_first_1_bit(const __m256i* m256i)
{
    __m256i cmp = _mm256_cmpeq_epi32(*m256i, _mm256_setzero_si256()); // compare with zero to find the first non-zero 32bit group
    uint8_t zero_mask = _mm256_movemask_ps(_mm256_castsi256_ps(cmp)); // mask of zero 32bit groups
    uint8_t nonzero_mask = ~ zero_mask; // bitwise not the mask, 1 means non-zero 32bit group in the bitset

    if (nonzero_mask == 0)
    {
        return 256;  // none of the groups have 1, so all bits are zero in the bitset
    }

    uint32_t idx_first_1_group = _tzcnt_u32(nonzero_mask);  // first non-zero 32bit group
    uint32_t first_1_group = ((uint32_t*)m256i)[idx_first_1_group];  // get the first non-zero 32bit group
    uint32_t idx_first_1 = _tzcnt_u32(first_1_group);  // find the first 1 in the first non-zero 32bit group
    return 32 * idx_first_1_group + idx_first_1;  // combine the index
}

int vector_find_first_0_bit(const uint32_t *m256)
{
    __m256i inverted_bitset = ~ _mm256_lddqu_si256((const __m256i*)m256); // invert the bitset to find the first 1
    int result = vector_find_first_1_bit(&inverted_bitset);
    return result;
}

int vector_find_first_gte(const int32_t* array, int32_t num)
{
    __m256i sizes = _mm256_lddqu_si256((__m256i *)array);
    __m256i num8 = _mm256_set1_epi32(num - 1);  // minus one to deal with gte

    __m256i result = _mm256_cmpgt_epi32(sizes, num8);
    __m256 cmp_ps = _mm256_castsi256_ps(result);
    int mask = _mm256_movemask_ps(cmp_ps);
    uint32_t trail = _tzcnt_u32(mask);
    return trail;
}

int vector_dennis_first_ge(const int* arr, int num)
{
    __m256i haystack = _mm256_lddqu_si256((const __m256i*)arr);
    __m256i needle   = _mm256_set_epi32(num, num, num, num, num, num, num, num);
    __m256i comp     = _mm256_cmpgt_epi32(haystack, needle);
    int mask         = _mm256_movemask_ps(_mm256_castsi256_ps(comp));
    return __builtin_ctz(mask);
}

int vector_dennis_0_bit(const int* arr)
{
    __m256i haystack = _mm256_lddqu_si256((const __m256i*)arr);
    __m256i needle   = _mm256_set_epi32(0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
    __m256i comp     = _mm256_cmpeq_epi32(haystack, needle);
    int mask         = _mm256_movemask_ps(_mm256_castsi256_ps(comp));
    int ind          = __builtin_ctz(~mask);

    if (ind == 8)
        return 256;
    int check   = ~arr[ind];
    int bit_ind = __builtin_clz(check);
    return 32*ind + (31-bit_ind);
}

int vector_dennis_find_int(const int* arr, int num)
{
    __m256i haystack = _mm256_lddqu_si256((const __m256i*)arr);
    __m256i needle   = _mm256_set_epi32(num, num, num, num, num, num, num, num);
    __m256i comp     = _mm256_cmpeq_epi32(haystack, needle);
    int mask         = _mm256_movemask_ps(_mm256_castsi256_ps(comp));
    return __builtin_ctz(mask);
}

#define INT_MIN 0xFFFFFFFF

int main(int argc, char* argv[])
{
    int32_t bitset[8]; // 0 => free, 1 => taken
    memset(bitset, 7, sizeof(bitset));

    int pos = vector_dennis_find_int(bitset, 7);
    while (0<=pos && pos<=7)
    {
        bitset[pos] = 0;
        pos = vector_dennis_find_int(bitset, 7);
    }

    memset(bitset, 7, sizeof(bitset));
    pos = vector_dennis_first_ge(bitset, INT_MIN);
    while (0<=pos && pos<=7)
    {
        bitset[pos] = INT_MIN;
        pos = vector_dennis_first_ge(bitset, INT_MIN);
    }

    memset(bitset, 7, sizeof(bitset));
    pos = vector_dennis_0_bit(bitset);
    while (0<=pos && pos<=255)
    {
        bitset[pos/32] |= 1 << (pos % 32);
        pos = vector_dennis_0_bit(bitset);
    }













//    __m128i arr = _mm_setr_epi8(0,1,2,7,4,5,6,3,8,9,10,11,12,13,14,15);
//    __m128i num = _mm_set1_epi8(20);
//    printf("%d\n", vec_index(arr,num));
//
//
//    // 8, 32 bit numbers
//    __m256i arr8 = _mm256_set_epi32(2356634,453,7,7,7,8,9876365,10);
//    __m256i num8 = _mm256_set1_epi32(9);
//
//    __m256i cmp = _mm256_cmpeq_epi32(arr8, num8);
//    __m256 cmp_ps = _mm256_castsi256_ps(cmp);
//    int mask = _mm256_movemask_ps(cmp_ps);
//    int res = 8-1-_tzcnt_u32(mask);
//    printf("%d\n", res);
//
//    int nums[8] = {2,4,8,16,32,64,128,256};
//    int res = vector_find_first_gte(nums, 32);
//    printf("%d\n", res);
//
//    uint32_t nums2[8] = {0xFFFFFFFF,0xFFFFFFFF - (1<<3),0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF};
//    int res2 = vector_find_first_0_bit(nums2);
//    printf("%d\n", res2);

    //int32_t nums3[8] = {1,2,3,4,5,6,7,8};
    //int res3 = vector_find_int(4, nums3);
    //printf("%d\n", res3);
}

