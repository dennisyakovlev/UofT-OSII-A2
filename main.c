#include <stdio.h>
#include "intrinsics.h"
#include "alloc.h"

int main(void)
{
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

    int32_t nums3[8] = {1,2,3,4,5,6,7,8};
    int res3 = vector_find_int(4, nums3);
    printf("%d\n", res3);
}

