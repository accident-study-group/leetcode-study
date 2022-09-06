import math

class Solution:
    def climbStairs(self, n: int) -> int:
        q, r = divmod(n, 2)
        result = 1 if r else 2 # 1 -> 모두 1인 경우, 2 -> 모두 1인 경우, 모두 2인 경우
        for i in range(1, q + r):
            result += math.factorial(n-i) / (math.factorial(i) * math.factorial(n-2*i))
        return int(result)
