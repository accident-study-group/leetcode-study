const Set<String> commonPrimes = {'+', '-'};
const Set<String> priorityPrimes = {'*', '/'};
const Set<String> primes = {...commonPrimes, ...priorityPrimes};

class Solution {
  int calculate(String s) {
    List<String> removedSpaceStrings = s
        .replaceAll(" ", '')
        .split('')
        .reversed
        .toList();

    List<dynamic> stack = [];

    while (removedSpaceStrings.isNotEmpty) {
      // Terms가 전부 스택으로 들어가지 않은 경우
      // Terms에서 하나씩 제거 하면서 돌아간다.

      // 괄호가 없으니 * / 는 즉시 계산
      if (priorityPrimes.contains(removedSpaceStrings.last)) {
        stack.add(operate(stack.removeLast(), removedSpaceStrings.removeLast(),
            parseNumber(removedSpaceStrings)
        ));
        // + -는 스택과 비교
      } else if (commonPrimes.contains(removedSpaceStrings.last)) {
        stack.add(removedSpaceStrings.removeLast());
        if (stack.length > 3) {
          stack.insert(0,
              operate(stack.removeAt(0), stack.removeAt(0), stack.removeAt(0)));
        }
      } else {
        stack.add(parseNumber(removedSpaceStrings));
      }
    }
    while (stack.length >= 3) {
      stack.insert(
          0, operate(stack.removeAt(0), stack.removeAt(0), stack.removeAt(0)));
    }

    return stack.first;
  }


  int operate(int number1, String prime, int number2) {
    switch (prime) {
      case '+':
        return number1 + number2;
      case '-':
        return number1 - number2;
      case '/':
        return number1 ~/ number2;
      case '*':
        return number1 * number2;
      default:
        throw UnimplementedError();
    }
  }


  int parseNumber(List<String> removedSpaceStrings) {
    var accString = '';
    while (removedSpaceStrings.isNotEmpty &&
        !primes.contains(removedSpaceStrings.last)) {
      accString += removedSpaceStrings.removeLast();
    }

    return int.parse(accString);
  }
}