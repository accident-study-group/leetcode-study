#include <bits/stdc++.h>
using namespace std;

class Solution
{
public:
    vector<vector<int>> updateMatrix(vector<vector<int>> &mat)
    {
        int m = mat.size();
        int n = mat[0].size();
        int max_dis = m + n - 2;

        for (int i = 0; i < m; i++)
        {
            for (int j = 0; j < n; j++)
            {
                if (mat[i][j] == 0)
                    continue;
                int top = i > 0 ? mat[i - 1][j] : max_dis;
                int left = j > 0 ? mat[i][j - 1] : max_dis;

                mat[i][j] = min(top, left) + 1;
            }
        }
        for (int i = m - 1; i >= 0; i--)
        {
            for (int j = n - 1; j >= 0; j--)
            {
                if (mat[i][j] == 0)
                    continue;
                int bottom = i < m - 1 ? mat[i + 1][j] : max_dis;
                int right = j < n - 1 ? mat[i][j + 1] : max_dis;

                mat[i][j] = min(mat[i][j], min(bottom, right) + 1);
            }
        }
        return mat;
    }
};