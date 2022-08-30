import kotlin.math.sign


class Solution {
    fun findMedianSortedArrays(nums1: IntArray, nums2: IntArray): Double {
        val m = nums1.size;
        val n = nums2.size;

        var sortedList = mutableListOf<Int>()
        var nums1List = nums1.toMutableList();
        var nums2List = nums2.toMutableList();

        while (sortedList.size < m + n) {

            if (nums1List.isNotEmpty() && nums2List.isNotEmpty()) {
                when (nums1List.first().compareTo(nums2List.first())) {
                    1 -> sortedList.add(nums2List.removeAt(0))
                    else -> sortedList.add(nums1List.removeAt(0))
                }
            }

            if (nums1List.isEmpty()) {
                sortedList.addAll(nums2List)
            } else if (nums2List.isEmpty()) {
                sortedList.addAll(nums1List)
            }
        }
        val size = sortedList.size;
        if (size % 2 == 0) {
            return (sortedList.get(size / 2 - 1) + sortedList.get(size / 2)) / 2.0
        } else {
            return sortedList.get(size / 2).toDouble();
        }
    }
}

//Runtime: 442 ms, faster than 80.74% of Kotlin online submissions for Median of Two Sorted Arrays.
//Memory Usage: 59.4 MB, less than 25.92% of Kotlin online submissions for Median of Two Sorted Arrays.