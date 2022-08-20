class Solution {
  int search(List<int> nums, int target) {
    return nums.indexWhere((e) => e == target);
  }
}