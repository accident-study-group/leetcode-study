// 다트와 마찬가지로
// Set을 이용해 시간 절약
class Solution {
    fun twoSum(nums: IntArray, target: Int): IntArray {

        var answer = IntArray(2)
        var sets = nums.toSet()

        for(i : Int in 0 .. nums.size - 1){

            if(sets.contains(target - nums.get(i)))   {
                val index = nums.indexOf(target - nums.get(i))
                if(index != -1 && index != i){
                    answer.set(0,i)
                    answer.set(1,index)
                    break
                }
            }
        }
        return answer
    }
}
