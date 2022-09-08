using namespace std;

class Solution
{
public:
    void rotate(vector<vector<int>> &matrix)
    {
        int count = matrix.size() / 2;
        int size = matrix[0].size();

        for (int i = 0; i < count; i++)
        {
            vector<int> arr = {};
            for (int j = 0; j < size - i - 1; j++)
            {
                arr.push_back(matrix[0 + i + j][0 + i]);
            }

            for (int j = 0; j < size - 2 * i - 1; j++)
            {
                matrix[0 + j + i][0 + i] = matrix[size - 1 - i][0 + i + j];
            }

            for (int j = 0; j < size - 2 * i - 1; j++)
            {
                matrix[size - 1 - i][0 + i + j] = matrix[size - 1 - i - j][size - 1 - i];
            }

            for (int j = 0; j < size - 2 * i - 1; j++)
            {
                matrix[size - 1 - i - j][size - 1 - i] = matrix[0 + i][size - 1 - i - j];
            }

            for (int j = 0; j < size - 2 * i - 1; j++)
            {
                matrix[0 + i][size - 1 - i - j] = arr[j];
            }
        }
    }
};