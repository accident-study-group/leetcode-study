#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        map<int, int> nums_map;
        map<int, int> duplicated_map;

        vector<int> answer;
        for(auto const &num : nums) { 
            if(nums_map[num]) {
               duplicated_map[num] = &num - &nums[0];
            } else {
               nums_map[num] = &num - &nums[0];
            }
        }
        
        for(const auto& elem : nums_map)
        {
           //std::cout << elem.second << "\n"; // 너무 오랜만의 cpp라 문법이 기억이 안나 쓴 print문
            
            int remain = target - elem.first;
            cout << remain << '\n';
            if(nums_map[remain]){
                answer.push_back(elem.second);
                answer.push_back(nums_map[remain]);
                break;
            } 
        }
        
        return answer;
    }
};