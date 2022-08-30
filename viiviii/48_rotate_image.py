class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        n = len(matrix)
        depth = n // 2
        while depth > 0:
            depth -= 1
            next_ = depth
            while next_ < n - depth - 1:
                i, j = depth, next_
                current = matrix[i][j]
                for _ in range(4):
                    i, j = j, n-1-i
                    tmp = matrix[i][j]
                    matrix[i][j] = current
                    current = tmp
                next_ += 1
        return matrix
