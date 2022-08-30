class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        indexs = {}
        for i, num in enumerate(nums):
            addend: int = target - num
            if addend in indexs:
                return [indexs[addend], i]
            else:
                indexs[num] = i
