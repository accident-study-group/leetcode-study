class Solution {
  List<int> twoSum(List<int> nums, int target) {
      
    List<int> answer = [];
      
    for(int i = 0; i < nums.length; i++){
        var result = nums.indexWhere((e) => e == target - nums[i], i+1);
        if(result != -1){
            answer.add(i);
            answer.add(result);
            break;
        }
    }
      
      return answer;
  }
}
