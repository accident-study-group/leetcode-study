class Solution {
  int lengthOfLongestSubstring(String s) {
    int cachedRepeat = 0;

    Set<String> usingCharacters = {};
    List<String> cachedString = [];

    for (String char in s.split("")) {
      cachedString.add(char);

      if (!usingCharacters.add(char)) {
        cachedString = cachedString.sublist(cachedString.indexOf(char) + 1);
        usingCharacters = cachedString.toSet();
      }

      if (cachedRepeat < cachedString.length) {
        cachedRepeat = cachedString.length;
      }
    }
    return cachedRepeat;
  }
}
