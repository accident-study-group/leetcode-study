#include <bits/stdc++.h>
using namespace std;

class Solution
{
public:
    int climbStairs(int n)
    {
        int answer[46] = {1, 1};
        if (n == 1)
        {
            return 1;
        }

        if (n > 45)
        {
            return -1;
        }

        for (int i = 2; i <= n; i++)
        {
            answer[i] = answer[i - 1] + answer[i - 2];
        }

        return answer[n];
    }
};