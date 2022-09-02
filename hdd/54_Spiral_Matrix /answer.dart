// 풀이

// 방향 전환의 수만큼 반복하게 하며, 방향전환할 때 마다 i를 1 올린다.
// ->, <- 동작 후에 진행 방향으로 1씩 패딩이 증가한다.

// 방향 전환 횟수 조건
// 방향 전환 횟수는 기본적으로 세로에 영향을 받는다.
// 세로 <= 가로인 경우 방향 세로 * 2 - 1
// 세로 > 가로인 경우 (세로 * 2 - 1) - ((세로 - 가로) * 2 - 1)

class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {
    List<int> snailArray = [];

    int width = matrix[0].length;
    int height = matrix.length;
    int padding = 0;

    var count = 0;
    if (height > width) {
      count = (height * 2 - 1) - ((height - width) * 2 - 1);
    } else {
      count = height * 2 - 1;
    }

    for (int i = 0; i < count; i++) {
      switch (i % 4) {
        case 0:
          for (int x = padding ~/ 2; x < width - padding ~/ 2; x++) {
            snailArray.add(matrix[padding ~/ 2][x]);
          }
          padding++;
          break;
        case 1:
          for (int y = padding ~/ 2 + 1; y < height - padding ~/ 2; y++) {
            snailArray.add(matrix[y][width - (padding ~/ 2 + 1)]);
          }
          break;
        case 2:
          for (int x = width - (padding ~/ 2 + 2); x >= padding ~/ 2; x--) {
            snailArray.add(matrix[height - (padding ~/ 2 + 1)][x]);
          }
          padding++;
          break;
        default:
          for (int y = height - (padding ~/ 2 + 1); y >= padding ~/ 2; y--) {
            snailArray.add(matrix[y][padding ~/ 2 - 1]);
          }
          break;
      }
    }
    return snailArray;
  }
}



// 최고 기록
// Runtime: 282 ms, faster than 100.00% of Dart online submissions for Spiral Matrix.
// Memory Usage: 138.4 MB, less than 100.00% of Dart online submissions for Spiral Matrix.
