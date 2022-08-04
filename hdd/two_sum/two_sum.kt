class Solution {
    fun twoSum(nums: IntArray, target: Int): IntArray {
        
        var answer = IntArray(2)
        
        for(i : Int in 0 .. nums.size - 1){
         val index = nums.indexOf(target - nums.get(i))
         if(index != -1 && index != i){
             answer.set(0,i)
             answer.set(1,index)
             break
         }
        }
        return answer
    }
}
