// 하...
// 피보나치 수열이었다니..

class Solution {
  int climbStairs(int n) {
    if (n == 0) return 0;
    if (n == 1) return 1;
    int a = 1;
    int b = 1;

    for (int i = 2; i <= n; i++) {
      int tmp = a + b;
      a = b;
      b = tmp;
    }
    return b;
  }
}