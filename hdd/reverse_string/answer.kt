import kotlin.math.sign
import kotlin.math.abs

class Solution {
    fun reverse(x: Int): Int {
        if(x == 0){
            0
        }

        val abs = abs(x)
        if(abs % 10 == 0){
            return divideByTen(abs / 10) * x.sign;
        }else {
            return divideByTen(abs) * x.sign;
        }
    }

    fun divideByTen(x: Int) : Int{
        var cachedString = ""
        var temp = x;

        while(temp > 0){
            cachedString = "$cachedString${temp%10}"
            temp = temp / 10
        }

        return cachedString.toIntOrNull() ?: 0
    }
}

//Runtime: 187 ms, faster than 84.14% of Kotlin online submissions for Reverse Integer.
//Memory Usage: 35.6 MB, less than 30.62% of Kotlin online submissions for Reverse Integer.