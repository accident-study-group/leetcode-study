class Solution {
  int search(List<int> nums, int target) {
    int front = 0;
    int rear = nums.length - 1;

    while(front <= rear){
      int middle = (front + rear) ~/ 2;
      int middleElement = nums[middle];

      // switch(middleElement.compareTo(target)){
      //     case 0:
      //         return target;
      //     case 1:
      //         if(middleElement > nums[rear] && target < nums[rear]){
      //             target = front + 1;
      //         } else {
      //             target = rear - 1;
      //         }
      //         break;
      //     case -1:
      //         if(middleElement < nums[front] && target > nums[front]){
      //             target = rear - 1;
      //         } else {
      //             target = front + 1;
      //         }
      // }
      if(middleElement == target){
        return middle;
      }
      // 중간 값 기준으로 앞에 뒤죽박죽인 값이 있는 경우
      if(middleElement < nums[front]){
        // 타겟이 중간값보다 크면서 타겟이 마지막 값보다 작거나 같으면 앞에걸 버린다.
        if(middleElement < target && target <= nums[rear]){
          front = middle + 1;
        } else {
          rear = middle - 1;
        }
        // 중간 값 기준으로 앞에 로테이션 된 값이 있는 경우
      } else {
        if(middleElement > target && target >= nums[front]){
          rear = middle -1;
        } else {
          front = middle + 1;
        }
      }
    }
    return -1;
  }
}


// 4 5 6 7 8 0 1
// 11 12 6 7 8 9 10



// middle < rear || target <= rear
// front = middle + 1;

// else
// rear = middle - 1;