class Solution:
    def search(self, nums: List[int], target: int) -> bool:
        start, end = 0, len(nums) - 1
        while start <= end:
            mid = start + ((end - start) // 2)
            l, m, r = nums[start], nums[mid], nums[end]
            if target in (l, m, r):
                return True
            if l == m == r:
                start += 1
                continue
            maximum = max(l, m, r)
            if self.in_right(m, target, r, mixed=(m == maximum)):
                start, end = mid + 1, end - 1
            else:
                start, end = start + 1, mid - 1
        return False

    def in_right(self, m: int, x: int, r: int, mixed: bool) -> bool:
        if mixed:
            return m <= x or x <= r
        return m <= x and x <= r
