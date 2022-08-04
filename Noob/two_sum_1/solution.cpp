#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int, int> nums_map;        
        for(auto const &num : nums)
        {   
            if(nums_map.count(target - num)){
                return {nums_map[target - num], (int)(&num - &nums[0])};
            }
            nums_map[num] = &num - &nums[0];
        }       
        
        return {};
    }

    // Runtime: 7 ms, faster than 98.29% of C++ online submissions for Two Sum.
    // Memory Usage: 10.9 MB, less than 47.70% of C++ online submissions for Two Sum.
};