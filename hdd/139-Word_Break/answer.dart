// class Solution {
//   bool wordBreak(String s, List<String> wordDict) {
//     for(int i = 0; i < wordDict.length; i++){
//       var tempString = s.replaceFirst(wordDict[i]," ");
//       print("tempString = $tempString");
//       int count = 0;
//       int j = (i+1) % wordDict.length;
//       while(count < wordDict.length){
//         tempString = tempString.replaceAll(wordDict[j]," ");
//         print("tempString = $tempString");
//         count++;
//         j = (j + 1) % wordDict.length;
//       }
//       if(tempString.replaceAll(" ","").isEmpty){
//         return true;
//       }
//     }
//     return false;
//   }
// }

class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    Set<String> wordDictSet = wordDict.toSet();

    var tempString = s;
    var list = wordDictSet.where((element) =>
    tempString.contains(element) && tempString.startsWith(element));

    while (list.isNotEmpty) {
      tempString.substring(start)
    }

    return false;
  }
}