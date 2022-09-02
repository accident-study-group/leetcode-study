# 227. Basic Calculator II

https://leetcode.com/problems/basic-calculator-ii/

Example 1:
```
Input: s = "3+2*2"
Output: 7
```

Example 2:
```
Input: s = " 3/2 "
Output: 1
```

Example 3:
```
Input: s = " 3+5 / 2 "
Output: 5
```


## 공통 과정
1. ``String s`` 를 ``s.split()``해서  ``List<String> terms``로 분리한다. (Dart)

## 떠오르는 방법 1 (미완)

1. ``String s`` 를 ``List<String> primes`` 와 ``List<int> numbers`` 로 나눈다.



## 떠오르는 방법 2
1. ``List<String> terms``를 반복문으로 돌리며 숫자와 ``+, -`` 기호들 까지는 계속 스택에 넣는다.
2. 반복문을 돌리는 중간에 ``/, *``를 만나면 스택에서 앞의 숫자를, ``List<String> terms`` 다음 숫자를 빼온 뒤 계산하고 다시 스택에 넣는다.
3. 스택에 ``/, *``와 같은 우선순위 연산자가 없을테니 그냥 처음부터 다시 계산시킨다.
