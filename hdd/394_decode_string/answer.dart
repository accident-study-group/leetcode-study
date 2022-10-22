class Solution {
  final int zero = '0'.codeUnitAt(0);
  final int nine = '9'.codeUnitAt(0);

  String decodeString(String s) {
    List<String> stack = [];

    for (int i = 0; i < s.length; i++) {
      // ']'가 아닐 경우의 수가 훨씬 많기때문에 가독성을 위해서
      if (s[i] != ']') {
        stack.add(s[i]);
      } else {
        String operand = '';
        String multipleString = '';

        // 연산할 String 만들기
        while (stack.last != '[') {
          operand = stack.removeLast() + operand;
        }

        // [ 없애기
        stack.removeLast();

        // 곱할 숫자 구하기
        while (stack.isNotEmpty &&
            zero <= stack.last.codeUnitAt(0) &&
            stack.last.codeUnitAt(0) <= nine) {
          multipleString = stack.removeLast() + multipleString;
        }
        int multiple = int.parse(multipleString);

        // 곱할 숫자만큼의 횟수만큼 연산할 String stack 에 넣기
        for (int j = 0; j < multiple; j++) {
          stack.add(operand);
        }
      }
    }
    return stack.join();
  }
}
