class Solution:
    def calculate(self, s: str) -> int:
        result = 0
        left_operand, operator, right_operand = 1, '*', ''
        for c in s:
            if c.isspace():
                continue
            if c.isdigit():
                right_operand += c
                continue
            if operator in ('+', '-'):
                result += left_operand
                left_operand = 0
            left_operand = self.evaluate(left_operand, operator, int(right_operand))
            operator, right_operand = c, ''
        return result + self.evaluate(left_operand, operator, int(right_operand))
  
    def evaluate(self, num: int, operator: str, other: int) -> int:
        match operator:
            case '-':
                return num - other
            case '+':
                return num + other
            case '/':
                return int(num / other)
            case '*':
                return num * other
