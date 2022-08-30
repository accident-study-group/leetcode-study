class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {
    List<int> snailArray = [];

    int width = matrix[0].length;
    int height = matrix.length;

    int padding = 0;


    for(int i = 0; i < width + height - 1; i++){
      if(i % 4 == 0){
        for(int x = padding ~/ 2; x < width - padding ~/ 2; x++){
          snailArray.add(matrix[0 + padding ~/ 2][x]);
        }

        padding++;
      }

      if(i % 4 == 1){
        for(int y = padding ~/ 2 + 1; y < height - padding ~/ 2; y++){
          snailArray.add(matrix[y][width - (padding ~/ 2 + 1)]);
        }
      }

      if(i % 4 == 2){
        for(int x = width - (padding ~/ 2 + 2); x >= 0 + padding ~/ 2; x--){
          snailArray.add(matrix[height - (padding ~/ 2 + 1)][x]);
        }

        padding ++;
      }

      if(i % 4 == 3){
        for(int y = height - (padding ~/ 2 + 1); y >= 0 + padding ~/ 2; y--){
          snailArray.add(matrix[y][0 + (padding ~/ 2 -1)]);
        }
      }
    }

    return snailArray;

  }
}

// 틀린 케이스 6, 9, 7 => 반복문 조건에 부합하지 않음. 1 + 3 - 1 = 3 