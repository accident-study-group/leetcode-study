#include <bits/stdc++.h>
using namespace std;

class Solution
{
public:
    int search(vector<int> &nums, int target)
    {
        int low = 0;
        int high = nums.size() - 1;
        int mid = 0;

        // 정말 특이한 케이스들을 미리 처리해버리고 return 해버리면 불필요한 연산을 줄일 수 있음
        if (nums.size() == 1)
        {
            if (nums[0] == target)
            {
                return 0;
            }
            else
            {
                return -1;
            }
        }

        while (low <= high)
        {
            mid = low + (high - low) / 2;

            if (nums[mid] == target)
            {
                return mid;
            }
            if (nums[mid] > nums[low]) // 아직, pivot 보다 큰 수가 많다는 뜻
            {
                if (nums[low] > target || nums[mid] < target)
                {
                    low = mid + 1;
                }
                else
                {
                    high = mid - 1;
                }
            }
            else
            {
                if (nums[high] < target || nums[mid] > target)
                {
                    high = mid - 1;
                }
                else
                {
                    low = mid + 1;
                }
            }
        }

        return -1;
    }
};