class Solution:
    def longestPalindrome(self, s: str) -> str:
        min = 0
        max = len(s) - 1
        first = last = 0
        for i, c in enumerate(s):
            f = l = i
            # 동일 문자열 체크 - ex) bbbbb
            while l < max and c == s[l + 1]:
                l = l + 1
            # 대칭 문자열 체크 - ex) abcd(기준)dcba
            while f > min and l < max and s[f - 1] == s[l + 1]:
                f = f - 1
                l = l + 1
            if l - f > last - first:
                first, last = f, l
        return s[first:last + 1]
