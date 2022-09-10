class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        self.rotate_with_degrees(matrix, 90)
    
    def rotate_with_degrees(self, matrix, degrees):
        assert not degrees % 90
        degrees = degrees if not 360 % degrees else -1 * (360 % degrees)
        for _ in range(abs(degrees // 90)):
            if degrees > 0:         
                self.transpose(matrix)
                self.reverse(matrix)
            else:
                self.reverse(matrix)           
                self.transpose(matrix)
  
    def transpose(self, matrix):
        n = len(matrix)
        for i in range(n):
            for j in range(i + 1, n):
                matrix[j][i], matrix[i][j] = matrix[i][j], matrix[j][i]
                
    def reverse(self, matrix):
        n = len(matrix)
        for i in range(n):
            for j in range(n // 2):
                matrix[i][j], matrix[i][n - 1 - j] = matrix[i][n - 1 - j], matrix[i][j]
