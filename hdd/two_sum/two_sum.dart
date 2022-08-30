//contains의 시간복잡도가 1이 Set을 만들어
//List에서 불필요한 반복을 돌 필요 없도록 변경

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Set<int> numsSet = nums.toSet();
    for (int i = 0; i < nums.length; i++) {
      if (numsSet.contains(target - nums[i])) {
        var result = nums.indexWhere((e) => e == target - nums[i], i + 1);
        if (result != -1) {
          return [i, result];
        }
      }
    }
    return [];
  }
}
