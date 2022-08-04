#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        map<int, int> nums_map;        
        for(auto const &num : nums)
        {   
            if(nums_map.count(target - num)){
                int idx =  &num - &nums[0];                
                return {idx, nums_map[target - num]};
                break;
            }
            nums_map[num] = &num - &nums[0];
        }       
        
        return {};
    }

    // Runtime: 9 ms, faster than 94.57% of C++ online submissions for Two Sum.
    // Memory Usage: 11 MB, less than 24.23% of C++ online submissions for Two Sum.
};