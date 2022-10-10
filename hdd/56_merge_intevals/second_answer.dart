class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    List<List<int>> answer = [];

    answer.add(intervals[0]);

    int index = 0;
    for (int i = 1; i < intervals.length; i++) {
      var start = intervals[i][0];
      var end = intervals[i][1];

      var compareStart = answer[index][0];
      var compareEnd = answer[index][1];

      if (start <= compareEnd) {
        if (start <= compareStart) {
          answer[index][0] = start;
        }

        if (compareEnd <= end) {
          answer[index][1] = end;
        }
      } else {
        answer.add(intervals[i]);
        index++;
      }
    }
    return answer;
  }
}


// 더 작은 값이 뒤에 왔을 때 처리를 생각 못함..
// Input [[1,4],[0,0]]
// Output [[0,4]]
// Expected [[0,0],[1,4]]