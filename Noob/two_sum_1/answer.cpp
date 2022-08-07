#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        map<int, int> nums_map;

        vector<int> answer;
        for(auto const &num : nums) { 
            nums_map[num] = &num - &nums[0];
        }
        
        for(auto const &num : nums)
        {
            if(nums_map.count(target - num) && (&num - &nums[0] != nums_map[target - num])){
                answer.push_back(&num - &nums[0]);
                answer.push_back(nums_map[target - num]);
                break;
            }
        }       
        
        return answer;
    }

    // Runtime: 25 ms, faster than 52.81% of C++ online submissions for Two Sum.
    // Memory Usage: 12.5 MB, less than 5.76% of C++ online submissions for Two Sum.
};