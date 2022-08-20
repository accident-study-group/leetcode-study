class Solution {
  int search(List<int> nums, int target) {
    Map<int, int> rotateSortedArray =
    Map.fromIterables(nums, List.generate(nums.length, (int index) => index));

    return rotateSortedArray[target] ?? -1;
  }
}