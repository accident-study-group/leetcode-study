class Solution {
    val commonPrimes: Set<Char> = setOf<Char>('+', '-')
    val priorityPrimes: Set<Char> = setOf<Char>('*', '/')
    val primes: Set<Char> = commonPrimes + priorityPrimes

    fun calculate(s: String): Int {
        var stack: MutableList<Any> = mutableListOf()

        var numberStartingIndex = 0;

        for (i: Int in 0 until s.length) {

            if (primes.contains(s.get(i))) {
                var number = s.substring(numberStartingIndex, i).trim().toInt()

                if (!stack.isEmpty()) {

                    if (priorityPrimes.contains(stack.last())) {
                        var lastPrime = stack.removeAt(stack.lastIndex)
                        var lastNumber = stack.removeAt(stack.lastIndex)
                        number = operate(lastNumber as Int, lastPrime as Char, number as Int)

                    } else if (stack.size >= 3 && commonPrimes.contains(s.get(i))) {
                        stack.add(
                            0,
                            operate(stack.removeAt(0) as Int, stack.removeAt(0) as Char, stack.removeAt(0) as Int)
                        )
                    }
                }

                stack.add(number)
                stack.add(s[i]);
                numberStartingIndex = i + 1;

            }

            if (i == s.length - 1) {
                var number = s.substring(numberStartingIndex).trim().toInt()
                if (!stack.isEmpty() && priorityPrimes.contains(stack.last())) {
                    var lastPrime = stack.removeAt(stack.lastIndex)
                    var lastNumber = stack.removeAt(stack.lastIndex)
                    number = operate(lastNumber as Int, lastPrime as Char, number as Int)
                }

                stack.add(number)
            }
        }

        while (stack.size >= 3) {
            stack.add(0, operate(stack.removeAt(0) as Int, stack.removeAt(0) as Char, stack.removeAt(0) as Int))
        }

        return stack.first() as Int
    }

    fun operate(number1: Int, prime: Char, number2: Int): Int {
        return when (prime) {
            '+' ->
                number1 + number2;
            '-' ->
                number1 - number2;
            '/' ->
                number1 / number2;
            '*' ->
                number1 * number2;
            else ->
                throw IllegalArgumentException()
        }
    }
}