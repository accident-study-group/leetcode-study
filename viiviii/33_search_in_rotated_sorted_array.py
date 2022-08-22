class Solution:
    def search(self, nums: List[int], target: int) -> int:
        start, end = 0, len(nums) - 1
        while start <= end:
            mid = start + ((end - start) // 2)
            if nums[mid] == target:
                return mid
            l, m, r = nums[start], nums[mid], nums[end]
            if self.in_left(l, m, target):
                start, end = start, mid - 1
            elif self.in_right(r, m, target):
                start, end = mid + 1, end
            else:
                return -1

    def in_left(self, l: int, m: int, x: int) -> bool:
        if l > m:
            return l <= x or x < m
        return l <= x and x < m

    def in_right(self, r: int, m: int, x: int) -> bool:
        if r < m:
            return m < x or x <= r
        return m < x and x <= r
