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
            // std::cout << elem.second << "\n"; // 너무 오랜만의 cpp라 문법이 기억이 안나 쓴 print문
            // cout << num << '\n';
            // cout << &num - &nums[0] << '\n';
            int remain = target - num;
            // cout << remain << '\n';
            // cout << nums_map[remain] << '\n';
            if(nums_map.count(remain) && (&num - &nums[0] != nums_map[remain])){
                // 따라서 조건을 추가해서 현재 검사중인 index와 달라야함을 보여야 함
                answer.push_back(&num - &nums[0]);
                answer.push_back(nums_map[remain]);
                // 여기서 생각지도 못한 오류가 나와버렸다
                // 현재 검사중인 값 val에 대해 val + val = target이 되면, 값이 return이 되어버린다..
                break;
            }
        }
        
        
        
        return answer;
    }
};