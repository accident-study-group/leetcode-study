class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        n = n - 1
        if not n:
            return 1
        memo = [[1 for j in range(n)] for i in range(m)]
        for i in range(1, m):
            for j in range(1, n):
                left = memo[i][j-1]
                top = memo[i-1][j]
                memo[i][j] = left + top
        ways = 0
        for m in memo:
            ways += m[-1]
        return ways
