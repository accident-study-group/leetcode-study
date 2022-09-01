using namespace std;

// 정신을 놓고 있었던 것 같다
// 이건 90도씩 회전하는게 아니라 하나씩 오른쪽으로 옮기는 코드,,
/*
    [
        [1,2,3],
        [4,5,6],
        [7,8,9],
    ]
    를 기준으로
    [
        [4,1,2],
        [7,5,3],
        [8,9,6]
    ]
    를 만들 수 있다..
*/
class Solution
{
public:
    void rotate(vector<vector<int>> &matrix)
    {
        int count = matrix.size() / 2;
        int size = matrix[0].size();

        for (int i = 0; i < count; i++)
        {
            int first = matrix[0 + i][0 + i];

            for (int j = 0; j < size - 2 * i - 1; j++)
            {
                matrix[0 + j + i][0 + i] = matrix[0 + j + i + 1][0 + i];
            }

            for (int j = 0; j < size - 2 * i - 1; j++)
            {
                matrix[size - 1 - i][0 + i + j] = matrix[size - 1 - i][0 + i + j + 1];
            }

            for (int j = 0; j < size - 2 * i - 1; j++)
            {
                matrix[size - 1 - i - j][size - 1 - i] = matrix[size - 1 - i - j - 1][size - 1 - i];
            }

            for (int j = 0; j < size - 2 * i - 1; j++)
            {
                matrix[0 + i][size - 1 - i - j] = matrix[0 + i][size - 1 - i - j - 1];
            }

            matrix[0 + i][0 + i + 1] = first;
        }
    }
};