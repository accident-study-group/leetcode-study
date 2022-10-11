// 최소 공배수 최대 공약수를 이용한다면 숫자를 많이 줄일 수 있지 않을까?
// 예를들어 1은 5의 약수이므로, 5보다 큰 수에서 뺄 때 굳이 1을 사용할 필요가 없다.
class Solution {
  late final List<int> _coins;
  Map<int, int> _cache = {};

  int coinChange(List<int> coins, int amount) {
    if (amount == 0) return 0;
    _coins = coins;
    var result = f(amount);
    return result;
  }

  int f(int amount) {
    // 이 부분에서 가장 큰 수의 약수가 되는 친구들은 빼줘야하지않을까?
    // 1 같은 친구가... 횟수를 많이 잡아먹을 것 같음.
    if (amount == 0) return 0;
    if (_cache[amount] != null) return _cache[amount]!;

    var lessThan = _coins.where((e) => amount >= e);
    if (lessThan.isEmpty) return -1;
    if (lessThan.length == 1) {
      if(amount % lessThan.first == 0){
        return amount ~/ lessThan.first;
      }else {
        return -1;
      }
    }
    List<int> counts = [];

    for (var number in lessThan) {
      var result = f(amount - number);
      _cache[amount - number] = result;
      if (result != -1) {
        counts.add(1 + result);
      }
    }


    if (counts.isNotEmpty) {
      counts.sort((int a, int b) => a.compareTo(b));
      return counts[0];
    } else {
      return -1;
    }
  }
}
