import 'dart:collection';

class Solution {
  String removeDuplicateLetters(String s) {
    // 답으로 사용할 스택
    Stack<String> stack = Stack();
    // 스택에 첫 값이 담긴 시점부터 한번이라도 나왔던 알파벳들의 Set
    Set<String> seen = {};

    // 저장된 마지막 위치를 가지고 있는 맵
    // Set은 키가 있을 경우 저장이 안된다면, 맵은 덮어쓰는 걸 이용
    Map<String, int> lastOccureence = {};

    for (int i = 0; i < s.length; i++) {
      lastOccureence.addAll({s[i]: i});
    }

    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      // 1. c가 이미 Seen에 있지 않아야 하며
      // 2. c가 stack의 마지막 값보다 작아야 하고
      // 3. 스택의 마지막 값이 해당 값의 마지막 위치가 아니여야함.
      if (!seen.contains(c)) {
        while (!stack.isEmpty &&
            c.codeUnitAt(0) < stack.peak().codeUnitAt(0) &&
            lastOccureence[stack.peak()]! > i) {
          seen.remove(stack.pop());
        }
        seen.add(c);
        stack.push(c);
      }
    }

    String answer = "";
    while (stack.isNotEmpty) {
      print(stack.peak());
      answer = stack.pop() + answer;
    }
    return answer;
  }
}

// 다트의 컬렉션 객체를 보면 stack 이 없다...
// queue 라는 이름으로 deque 가 구현되어있는것같은데??
// 그래서 stack 을 직접 구현함.
class Stack<E> {
  final _stack = Queue<E>();

  int get length => _stack.length;

  bool canPop() => _stack.isNotEmpty;

  bool get isEmpty => _stack.isEmpty;

  bool get isNotEmpty => _stack.isNotEmpty;

  void push(E element) {
    _stack.addLast(element);
  }

  E pop() {
    return _stack.removeLast();
  }

  E peak() => _stack.last;

  String toString() => _stack.toString();
}
