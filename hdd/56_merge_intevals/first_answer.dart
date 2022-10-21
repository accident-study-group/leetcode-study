class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    List<List<int>> answer = [];
    int index = 0;
    for (int i = 0; i < intervals.length; i++) {
      // 시작지점 이걸 밖으로 빼도 될거같음.
      if (i == 0) {
        List<int> currentArray = [];
        currentArray.add(intervals[i][0]);
        currentArray.add(intervals[i][1]);
        answer.add(currentArray);
      } else {
        var start = answer[index][1];
        var end = intervals[i][0];

        if (end <= start) {
          answer[index][1] = intervals[i][1];
        } else {
          answer.add(intervals[i]);
          index++;
        }
      }
    }

    return answer;
  }
}


// 놓친 부분 배열이 아주 친절하게 들어올거라고 생각했다.
// 처음부터 다시 다 비교하도록 변경해야할것 같다.
// Input: [[1,4],[0,4]]
// Output:[[1,4]]
// Expected:[[0,4]]
