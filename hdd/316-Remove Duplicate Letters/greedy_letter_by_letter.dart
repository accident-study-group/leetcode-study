class Solution {
  String removeDuplicateLetters(String s) {
    print(s);

    List<int> count = List.filled(26, 0);
    int position = 0;

    // 단어가 나오는 횟수 카운팅
    for (int i = 0; i < s.length; i++){
      count[s.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }
    print("s $count");

    for (int i = 0; i < s.length; i++){
      // 현재 인덱스의 값이 현재 기억된 포지션의 단어보다 순서가 빠르다면 교체한다.
      if (s.codeUnitAt(i) < s.codeUnitAt(position)){
        position = i;
      }

      // 현재 인덱스에 저장된 값의 숫자를 1빼면서 0이되면 break함
      if(--count[s.codeUnitAt(i) - 'a'.codeUnitAt(0)] == 0){
        break;
      }
    }


    if(s.length == 0){
      return "";
    }  else {
      return s[position] + removeDuplicateLetters(s.substring(position).replaceAll(s[position],""));
    }
  }
}