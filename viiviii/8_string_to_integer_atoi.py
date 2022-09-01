class Solution:
    def myAtoi(self, s: str) -> int:
        a = s.lstrip()
        if not a:
            return 0
        end = 1
        for c in a[i:]:
            if not c.isdigit():
                break
            end += 1
        return self.clamp(self.a_to_i(a[:end]))

    def a_to_i(self, a: str) -> int:
        try:
            return int(a)
        except ValueError:
            return 0

    def clamp(self, i: int) -> int:
        MIN = -1 * (2 ** 31)
        MAX = (2 ** 31) - 1
        return min(max(i, MIN), MAX)
