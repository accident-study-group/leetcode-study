class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {
    List<int> snailArray = [];

    int width = matrix[0].length;
    int height = matrix.length;
    int diff = height - width;
    int padding = 0;

    var count = 0;
    if(height - width > 0){
      count = (height * 2 - 1) - (diff * 2 - 1);
    }else {
      count = height * 2 - 1;
    }


    for(int i = 0; i < count; i++){
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
