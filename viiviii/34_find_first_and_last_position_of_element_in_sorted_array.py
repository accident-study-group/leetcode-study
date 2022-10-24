class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        first = search_to_left(nums, target)
        last = search_to_right(nums, target)
        return [first, last]


def search_to_left(nums, target):
    first = -1
    start, end = 0, len(nums) - 1
    while start <= end:
        mid = start + ((end - start) // 2)
        if nums[mid] == target:
            first = mid
            end = mid - 1
        elif nums[mid] < target:
            start = mid + 1
        elif nums[mid] > target:
            end = mid - 1
    return first


def search_to_right(nums, target):
    last = -1
    start, end = 0, len(nums) - 1
    while start <= end:
        mid = start + ((end - start) // 2)
        if nums[mid] == target:
            last = mid
            start = mid + 1
        elif nums[mid] < target:
            start = mid + 1
        elif nums[mid] > target:
            end = mid - 1
    return last
