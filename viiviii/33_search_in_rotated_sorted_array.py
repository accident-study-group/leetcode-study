class Solution:
    def search(self, nums: List[int], target: int) -> int:
        start, end = 0, len(nums) - 1
        while start < end:
            i = start + int((end - start) // 2)
            if nums[i] == target:
                return i
            l, m, r = nums[start], nums[i], nums[end]
            search_left = l <= target < m if l <= m else l <= target or target < m
            start, end = (start, i) if search_left else (i + 1, end)
        return start if nums[start] == target else -1
