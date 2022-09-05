class Solution {
  int climbStairs(int n) {
    // 2가 0개인 경우 -> n C 0 = 1
    // 2가 1개인 경우 -> (n-1) C 1
    // ....
    // 2가 n/2 개인 경우 -> n ~ 2 C n ~/2

    int twoCounts = 0;
    int sum = 0;

    while (twoCounts <= (n / 2)) {
      sum += combination(n - twoCounts, twoCounts).round();
      twoCounts++;
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
