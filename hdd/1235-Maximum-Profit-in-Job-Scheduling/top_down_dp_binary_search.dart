import 'dart:math';

class Solution {
  List<int> memo = List<int>.filled(50001, 0);

  int jobScheduling(List<int> startTime, List<int> endTime, List<int> profit) {
    List<List<int>> jobs = [];

    // LeetCode에는 아래와 같은 방식으로 Job을 클래스로 만들지 않고,
    // 배열로 사용함. 배열이 클래스보다 런타임, 메모리 소모가 클까?
    for (int i = 0; i < profit.length; i++) {
      List<int> currJob = [];

      currJob.add(startTime[i]);
      currJob.add(endTime[i]);
      currJob.add(profit[i]);

      jobs.add(currJob);
    }

    jobs.sort((List<int> a, List<int> b) => a[0].compareTo(b[0]));

    for (int i = 0; i < profit.length; i++) {
      startTime[i] = jobs[i][0];
    }

    return _findMaxProfit(jobs, startTime);
  }

  int _findMaxProfit(List<List<int>> jobs, List<int> startTime) {
    for (int position = startTime.length - 1; position >= 0; position--) {
      int currentProfit = 0;

      int nextIndex = _findNextJob(startTime, jobs[position][1]);

      if (nextIndex != startTime.length) {
        currentProfit = jobs[position][2] + memo[nextIndex];
      } else {
        currentProfit = jobs[position][2];
      }

      if (position == startTime.length - 1) {
        memo[position] = currentProfit;
      } else {
        memo[position] = max(currentProfit, memo[position + 1]);
      }
    }

    return memo[0];
  }

  int _findNextJob(List<int> startTime, int lastEndingTime) {
    int start = 0;
    int end = startTime.length - 1;
    int nextIndex = startTime.length;

    while (start <= end) {
      int mid = (start + end) ~/ 2;

      if (startTime[mid] >= lastEndingTime) {
        nextIndex = mid;
        end = mid - 1;
      } else {
        start = mid + 1;
      }
    }
    return nextIndex;
  }
}

// Class
// class Job {
//   final int startTime;
//   final int endTime;
//   final int profit;
//
//   const Job(this.startTime, this.endTime, this.profit);
//
//   String toString() => "$startTime $endTime $profit";
// }
