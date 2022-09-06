import math

class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x < 10:
            return x >= 0
        power = int(math.log10(x))
        rest = x
        while power > 0:
            left, rest = divmod(rest, (10 ** power))
            rest, right = divmod(rest, 10)
            power -= 2
            if left != right:
                return False
        return True
