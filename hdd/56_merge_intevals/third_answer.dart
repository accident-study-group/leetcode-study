class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    // 첫 시작
    List<List<int>> answer = [];
    answer.add(intervals[0]);

    for (int i = 0; i < intervals.length; i++) {
      var start = intervals[i][0];
      var end = intervals[i][1];

      var initialStart = answer[0][0];
      var lastEnd = answer[answer.length - 1][1];

      if (start < initialStart && end < initialStart) {
        // 첫 시작보다 작은 경우
        answer.insert(0, intervals[i]);
      } else if (lastEnd < start && lastEnd < end) {
        // 마지막 값보다 큰 경우
        answer.add(intervals[i]);
      } else {
        if (answer.length == 1) {
          if (start <= answer[0][0]) {
            answer[0][0] = start;
          }

          if (answer[0][1] <= end) {
            answer[0][1] = end;
          }
        } else {
          for (int j = 1; j < answer.length; j++) {
            if (answer[j - 1][1] < start && end < answer[j][0]) {
              answer.insert(j, intervals[i]);
              break;
            } else if (answer[j][1] < start && answer[j][1] < end) {
              continue;
            } else {
              if (start <= answer[j-1][0]) {
                answer[j - 1][0] = start;
              }

              if (answer[j-1][1] <= end) {
                answer[j- 1][1] = end;
              }
            }
          }
          var index = 0;

          while(index < answer.length -1){

            var start = intervals[index][0];
            var end = intervals[index][1];

            var nextStart = answer[index+1][0];
            var nextEnd = answer[index+1][1];

            if (end < nextStart && start < nextStart) {
              index++;
              continue;
            } else {
              if (nextStart <= start) {
                answer[index][0] = nextStart;
              }
              if (nextEnd <= end) {
                answer[index][1] = end;
              }

              answer.removeAt(index+1);
            }
          }
        }
      }
    }

    return answer;
  }
}


// Input:[[2,3],[2,2],[3,3],[1,3],[5,7],[2,2],[4,6]]
// Output:[[1,6]]
// Expected:[[1,3],[4,7]]