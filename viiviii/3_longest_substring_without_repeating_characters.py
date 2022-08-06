class Solution:

    def lengthOfLongestSubstring(self, s: str) -> int:
        used = {}
        start = max_length = 0
        for i, v in enumerate(s):
            if v in used and not(start > used[v]):
                start = used[v] + 1
            else:
                max_length = max(max_length, i - start + 1)
            used[v] = i
        return max_length
