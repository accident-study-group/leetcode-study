class Solution {
    fun search(nums: IntArray, target: Int): Int {

        var front: Int = 0;
        var rear: Int = nums.size - 1;

        while (front <= rear) {
            var middle = (front + rear) / 2;
            var middleElement = nums[middle];

            if (middleElement == target) {
                return middle;
            }
            // 중간 값 기준으로 앞에 뒤죽박죽인 값이 있는 경우
            if (middleElement < nums[front]) {
                // 타겟이 중간값보다 크면서 타겟이 마지막 값보다 작거나 같으면 앞에걸 버린다.
                if (middleElement < target && target <= nums[rear]) {
                    front = middle + 1;
                } else {
                    rear = middle - 1;
                }
                // 중간 값 기준으로 앞에 로테이션 된 값이 있는 경우
            } else {
                if (middleElement > target && target >= nums[front]) {
                    rear = middle - 1;
                } else {
                    front = middle + 1;
                }
            }
        }
        return -1;
    }
}