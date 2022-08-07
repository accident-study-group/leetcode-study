class Solution {
  int reverse(int x) {

    // 숫자 범위
    if(x == 0){
      return 0;
    }

    if(x.abs() % 10 == 0){
      return divideByTen(x.abs() ~/ 10) * x.sign;
    }else {
      return divideByTen(x.abs()) * x.sign;
    }
  }

  divideByTen(int x){
    String cachedString = "";
    var temp = x;
    while(temp > 0){
      cachedString = "$cachedString${temp%10}";
      temp = temp ~/ 10;
    }


    var result = int.parse(cachedString);

    if(result <= pow(-2, 31) || result >= (pow(2,31) - 1)){
      return 0;
    }
    return result;
  }
}

//Runtime: 469 ms, faster than 100.00% of Dart online submissions for Reverse Integer.
//Memory Usage: 143.2 MB, less than 100.00% of Dart online submissions for Reverse Integer.
