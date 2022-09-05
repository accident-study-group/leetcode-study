class Solution {
  int climbStairs(int n) {
    // 2가 0개인 경우 -> n C 0 = 1
    // 2가 1개인 경우 -> (n-1) C 1
    // ....
    // 2가 n/2 개인 경우 -> n ~ 2 C n ~/2

    int twoCounts = 0;
    int sum = 0;

    while(twoCounts <= (n / 2)){
      sum += combination(n - twoCounts, twoCounts);
      twoCounts++;
    }
    return sum;
  }

  // 콤비네이션을 간단하게 구현하면 문제 끝날것같다.
  int combination(int n, int r){
    if(r == 0 || n == r) return 1;
    if(r == 1) return n;
    return factorial(n,r).round();
  }


  num factorial(int n, int r){
    if(r == 1) return n;
    return n / r * factorial(n-1, r-1);
  }
}