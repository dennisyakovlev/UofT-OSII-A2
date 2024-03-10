#include <immintrin.h>
#include <stdint.h>

#ifndef A2TEMP_INTRINSICS_H
#define A2TEMP_INTRINSICS_H


// -------------------------------  Vector Instructions Begin  ----------------------------
//region Vector Instructions

static inline __attribute__((always_inline)) int32_t vector_find_int(int32_t toFind, int32_t * from)
{
    __m256i arr8 = _mm256_lddqu_si256((__m256i *)from);
    __m256i num8 = _mm256_set1_epi32(toFind);

    __m256i cmp = _mm256_cmpeq_epi32(arr8, num8);
    __m256 cmp_ps = _mm256_castsi256_ps(cmp);
    int mask = _mm256_movemask_ps(cmp_ps);
    return _tzcnt_u32(mask);
}

/**
 * Find the first 1 bit in a 256 bit bitset
 * @param m256i the bitset to search
 * @return index of the first 1 bit, or 256 if no 1 bit is found
 */
static inline __attribute__((always_inline)) int vector_find_first_1_bit(const __m256i* m256i)
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

static inline __attribute__((always_inline)) int vector_find_first_0_bit(const uint32_t *m256)
{
    __m256i inverted_bitset = ~ _mm256_lddqu_si256((const __m256i*)m256); // invert the bitset to find the first 1
    int result = vector_find_first_1_bit(&inverted_bitset);
    return result;
}

/**
 * Find the first element in the array that is greater than or equal to the number
 * @param array Array of 8 32 bit integers
 * @param num The number to compare with
 * @return The index of the first element in the array which is >= num, or >=8 if no such element exists
 */
static inline __attribute__((always_inline)) int vector_find_first_gte(const int32_t* array, int32_t num)
{
    __m256i sizes = _mm256_lddqu_si256((__m256i *)array);
    __m256i num8 = _mm256_set1_epi32(num - 1);  // minus one to deal with gte

    __m256i result = _mm256_cmpgt_epi32(sizes, num8);
    __m256 cmp_ps = _mm256_castsi256_ps(result);
    int mask = _mm256_movemask_ps(cmp_ps);
    uint32_t trail = _tzcnt_u32(mask);
    return trail;
}

//endregion
// -------------------------------  Vector Instructions End   -----------------------------

#endif //A2TEMP_INTRINSICS_H
