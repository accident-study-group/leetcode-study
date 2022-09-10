const Set<String> commonPrimes = {'+', '-'};
const Set<String> priorityPrimes = {'*', '/'};
const Set<String> primes = {...commonPrimes, ...priorityPrimes};

class Solution {
  int calculate(String s) {
    List<dynamic> stack = [];

    // 마지막 기호의 Index
    // 해당 위치부터 다음 기호 혹은 String 의 길이까지 숫자를 substring 한다.
    int numberStartingIndex = 0;


    for(int i = 0; i < s.length; i++){
      // 현재 인덱스의 값이 기호인 경우
      if(primes.contains(s[i])){
        var number = int.parse(s.substring(numberStartingIndex,i).trim());

        // 스택이 비어있지 않다면
        if(stack.isNotEmpty){

          // stack의 마지막 값이 *,/ 인경우의 직전 스택에서 꺼내서 계산
          if(priorityPrimes.contains(stack.last)){
            var lastPrime = stack.removeLast();
            var lastNumber = stack.removeLast();
            number = operate(lastNumber,lastPrime,number);

            // 현재 기호가 +, - 인 경우 스택의 첫 값을 계산
          } else if (stack.length >= 3 && commonPrimes.contains(s[i])){
            stack.insert(0, operate(stack.removeAt(0), stack.removeAt(0), stack.removeAt(0)));
          }
        }

        stack.add(number);
        stack.add(s[i]);
        numberStartingIndex = i+1;
      }

      if(i == s.length-1){
        var number = int.parse(s.substring(numberStartingIndex).trim());
        if(stack.isNotEmpty && priorityPrimes.contains(stack.last)){
          var lastPrime = stack.removeLast();
          var lastNumber = stack.removeLast();
          number = operate(lastNumber,lastPrime,number );
        }

        stack.add(number);
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
}