class Solution:
    def calculate(self, s: str) -> int:
        left, operator, right = 0, '+', 0
        stack = []
        for c in s:
            if c.isdigit():
                right = right * 10 + int(c)
            elif c == '(':
                stack.append((left, operator))
                left, operator = 0, ''
            elif c == ')':
                right = self.evaluate(left, operator, right)
                left, operator = stack.pop()
            elif c in ('-', '+'):
                left = self.evaluate(left, operator, right)
                operator, right = c, 0
        return self.evaluate(left, operator, right)
    
    def evaluate(self, left_operand: int, operator: str, right_operand: int) -> int:
        match operator:
            case '':
                return right_operand
            case '-':
                return left_operand - right_operand
            case '+':
                return left_operand + right_operand
