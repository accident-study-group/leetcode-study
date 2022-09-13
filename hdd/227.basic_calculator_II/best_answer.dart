class Solution {
  bool _isDigit(int code) {
    return code >= '0'.codeUnitAt(0) && code <= '9'.codeUnitAt(0);
  }

  bool _isOperator(int code) {
    return code == '-'.codeUnitAt(0) ||
        code == '+'.codeUnitAt(0) ||
        code == '*'.codeUnitAt(0) ||
        code == '/'.codeUnitAt(0);
  }

  int calculate(String s) {
    if (s.isEmpty) {
      return 0;
    }
    int currentNumber = 0,
        lastNumber = 0,
        result = 0;
    int operation = '+'.codeUnitAt(0);

    for (int i = 0; i < s.length; i++) {
      int currentCodeUnit = s.codeUnitAt(i);
      if (_isDigit(currentCodeUnit)) {
        currentNumber =
            currentNumber * 10 + currentCodeUnit - '0'.codeUnitAt(0);
      }
      if (_isOperator(currentCodeUnit) || i == s.length - 1) {
        if (operation == '+'.codeUnitAt(0)) {
          result += lastNumber;
          lastNumber = currentNumber;
        } else if (operation == '-'.codeUnitAt(0)) {
          result += lastNumber;
          lastNumber = -currentNumber;
        } else if (operation == '*'.codeUnitAt(0)) {
          lastNumber *= currentNumber;
        } else if (operation == '/'.codeUnitAt(0)) {
          lastNumber ~/= currentNumber;
        }
        operation = currentCodeUnit;
        currentNumber = 0;
      }
    }

    result += lastNumber;
    return result;
  }
}
// 3 + 2 * 2
// 3
// + -> currentNumber = 3 result = 0 lastNumber = 0 operation = '+'
//   -> result = 0, lastNumber = 3 operation = '+' currentNumber = 0
// 2
// * -> currentNumber = 2 result = 3 lastNumber = 2 operation = '+'
//   -> currentNumber = 0 result = 3 lastNumber = 2 operation = '*
// 2 ( i == s.length - 1)
//   -> currentNumber = 2 result = 3 lastNumber = 4 operation = '*'
//   -> currentNumber = 0 result = 3 lastNumber = 4 operation = '*'

// 와 어떻게 이런생각 하는거지.. 
