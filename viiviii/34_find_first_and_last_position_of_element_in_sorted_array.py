class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        first = last = -1
        try:
            first = last = nums.index(target)
        except ValueError:
            return [first, last]
        
        start, end = first, len(nums) - 1
        while start <= end:
            mid = (start + end) // 2
            if nums[mid] == target:
                last = mid
                start = mid + 1
            else:
                end = mid -1
        return [first, last]
