class Solution:
    def reverse(self, x: int) -> int:
        is_positive = (x > 0)
        dividend = abs(x)
        reversed = 0
        while dividend:
            if reversed > 2_147_483_64:
                return 0
            if reversed == 2_147_483_64 and dividend > (7 if is_positive else 8):
                return 0
            dividend, r = divmod(dividend, 10)
            reversed = reversed * 10 + r
        return reversed if is_positive else reversed * -1
