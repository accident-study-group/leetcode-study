class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        left_or_right = True
        m, n= len(matrix), len(matrix[0])
        result = []
        i, j = 0, -1
        while n > 0 and m > 0:
            if left_or_right:
                for _ in range(n):
                    j += 1 if i < (len(matrix) + 1) // 2 else -1
                    result.append(matrix[i][j])
                m -= 1
            else:
                for _ in range(m):
                    i += 1 if j >= len(matrix[0]) // 2 else -1
                    result.append(matrix[i][j])
                n -= 1
            left_or_right = not left_or_right
        return result
