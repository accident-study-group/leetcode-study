class Solution {
  int climbStairs(int n) {
    // 2가 0개인 경우 -> n C 0 = 1
    // 2가 1개인 경우 -> (n-1) C 1
    // ....
    // 2가 n/2 개인 경우 -> n ~ 2 C n ~/2


    // n에서 찾을 수 있는 2의 최대 수
    int maximumTwoCount = n ~/ 2;
    // 현재 탐색하고 있는 2의 수
    int twoCount = 0;
    int sum = 0;

    while (twoCount <= maximumTwoCount) {
      sum += combination(n - twoCount, twoCount).round();
      twoCount++;
    }
    return sum;
  }

  // 계산 결과는 조합(combination)과 같음.
  num combination(int n, int r) {
    if (r == 0 || n == r) return 1;
    if (r == 1 || n - r == 1) return n;
    return n / r * combination(n - 1, r - 1);
  }
}
