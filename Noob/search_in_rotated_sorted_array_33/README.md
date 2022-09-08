# leetcode-study

- 33번 문제
- 이분 탐색에 pivot이 적용되어 있음
- 즉, pivot보다 큰 값들이 왼쪽, 작은 값들이 오른쪽에 모여있음

## 개선 과정
- 첫 시도에서 5ms가 나왔고, line 15~25의 if문을 추가하고 돌렸는데 이유를 모르겠지만 0ms가 나왔다..
- LeetCode의 채점 시스템이 조금 긴가민가 하다.

## 신경써야 할 점
- pivot이 되어 있다, 즉 단순히 low와 high만을 비교할 것이 아니라
- mid의 값이 target과 비교도 되어야 한다.

- https://leetcode.com/problems/search-in-rotated-sorted-array/
