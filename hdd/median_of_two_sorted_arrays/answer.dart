class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    int m = nums1.length;
    int n = nums2.length;

    List<int> sortedList = [];

    while(sortedList.length < m+n){

      if(nums1.isEmpty){
        sortedList.addAll(nums2);
      }else if(nums2.isEmpty){
        sortedList.addAll(nums1);
      } else {

        switch(nums1.first.compareTo(nums2.first)){
          case 1:
            sortedList.insert(sortedList.length, nums2.removeAt(0));
            break;
          default:
            sortedList.insert(sortedList.length, nums1.removeAt(0));
        }
      }
    }


    var length = sortedList.length;

    if(length.isOdd){
      return sortedList[(length ~/ 2)].toDouble();
    }else {
      return (sortedList[length ~/ 2 - 1] + sortedList[length ~/ 2]) / 2;
    }
  }
}
// 1차 시도
// Runtime: 927 ms, faster than 25.00% of Dart online submissions for Median of Two Sorted Arrays.
// Memory Usage: 148.4 MB, less than 100.00% of Dart online submissions for Median of Two Sorted Arrays.