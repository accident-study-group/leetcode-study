import math

class Solution:
    def reverse(self, x: int) -> int:
        is_negative = (x < 0)
        r = str(abs(x))[::-1]
        if self.outside_range(r, is_negative):
            return 0
        return int(r) * (-1 if is_negative else 1)
    
    def outside_range(self, r: str, is_negative: bool) -> bool:
        if not r[9:]:
            return False
        nums = int(r[:9])
        digit = int(r[9:])
        MAX = 2 ** 31 - (1 if not is_negative else 0)
        if nums != (MAX // 10):
            return nums > (MAX // 10)
        return digit > (MAX % 10)
