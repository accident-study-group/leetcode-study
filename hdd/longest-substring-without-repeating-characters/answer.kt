class Solution {
      fun lengthOfLongestSubstring(s: String): Int {
        var cachedRepeat = 0
        var usingCharacters = mutableSetOf<Char>()
        var cachedChar = ""

        for(char in s){
            cachedChar += char
            if(!usingCharacters.add(char)){
                cachedChar = cachedChar.substringAfter(char)
                usingCharacters = cachedChar.toSet().toMutableSet()
            }

            if(cachedRepeat < cachedChar.length){
                cachedRepeat = cachedChar.length
            }
        }

        return cachedRepeat

    }
}
