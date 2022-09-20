import kotlin.math.*

class Solution {
    fun climbStairs(n: Int): Int {
        var twoCounts = 0;
        var sum = 0;

        while(twoCounts <= n / 2){
            var aa = combination(n - twoCounts, twoCounts);
            sum += aa;
            twoCounts++;
        }

        return sum;
    }

    fun combination(n:Int, r:Int): Int {
        if(r == 0 || n == r) return 1;
        if(r == 1) return n;
        return factorial(n,r).roundToInt();
    }


    fun factorial(n: Int, r : Int): Double{
        if(r == 1) return n.toDouble();
        return n / r.toDouble() * factorial(n-1, r-1);
    }
}