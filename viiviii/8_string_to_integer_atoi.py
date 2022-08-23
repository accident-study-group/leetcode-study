class Solution:
    def myAtoi(self, s: str) -> int:
        start = end = 0
        a = s.lstrip()
        if not a:
            return 0
        if a[0] in ('-', '+'):
            start = end = 1
        for c in a[start:]:
            if not c.isdigit():
                return self.a_to_i_and_clamp(a[start:end], sign=a[:start])
            end += 1
        return self.a_to_i_and_clamp(a[start:end], sign=a[:start])

    def a_to_i_and_clamp(self, a: str, sign: str) -> int:
        i = self.a_to_i(a, sign)
        return self.clamp(i)

    def a_to_i(self, a: str, sign: str) -> int:
        i = int(a) if a else 0
        is_positive = not sign or sign == '+'
        return i if is_positive else i * -1

    def clamp(self, i: int) -> int:
        MIN = -1 * (2 ** 31)
        MAX = (2 ** 31) - 1
        if i < MIN:
            return MIN
        elif i > MAX:
            return MAX
        else:
            return i
