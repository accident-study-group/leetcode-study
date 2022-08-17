import math

class Solution:
    def convert(self, s: str, numRows: int) -> str:
        if numRows == 1:
            return s
        interval = 2 * numRows - 2
        total = len(s)
        result = ''
        for row in range(numRows):
            for column in range(row, total, interval):
                result += s[column]
                gap = column + interval - (2 * row)
                if 0 < row < numRows - 1 and gap < total:
                    result += s[gap]
        return result
