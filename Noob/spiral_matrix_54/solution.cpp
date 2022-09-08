using namespace std;

class Solution
{
public:
    vector<int> spiralOrder(vector<vector<int>> &matrix)
    {
        vector<int> answer = {};
        int x = 0;
        int y = -1;
        // (0,0) 좌표부터 값을 추가를 해야해서
        // 좋은 방법이 없나 고민하던 와중,, 차피 오른쪽 이동할건데 라고 생각해서 (0, -1)을 시작점으로 잡았다
        int direction = 0;
        // 진행 방향을 결정해주는 방향을 의미하는 변수
        // 0 : right, 1 : down, 2: left, 3: bottom

        int x_max = matrix.size() - 1; // 2nd Array[x][y]에서 이동할 수 있는 x의 최대 거리
        int y_max = matrix[0].size();  // 2nd Array[x][y]에서 이동할 수 있는 y의 최대 거리
        bool isCurrentY = true;        // x좌표를 움직일 건지, y좌표를 움직일 건지에 대한 bool Flag 변수

        int dx[] = {0, 1, 0, -1};
        int dy[] = {1, 0, -1, 0};
        // directon에 따라 (x,y)를 이동할 방향을 정해줌
        // ex) direction = 0일 때, dx[direction] = 0, dy[direction] = 1이 되어 (0,1)만큼 2차원 배열 내에서 좌표를 움직인다.

        while (x_max >= 0 && y_max >= 0)
        {
            if (isCurrentY)
            {
                for (int i = 0; i < y_max; i++)
                {
                    x += dx[direction];
                    y += dy[direction];
                    answer.push_back(matrix[x][y]);
                }
                y_max--;
            }
            else
            {
                for (int i = 0; i < x_max; i++)
                {
                    x += dx[direction];
                    y += dy[direction];
                    answer.push_back(matrix[x][y]);
                }
                x_max--;
            }

            isCurrentY = !isCurrentY; // y축을 움직였으면 다음은 x축을 움직여야함

            direction++;
            direction %= 4;
        }

        return answer;
    }
};