//[["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]]
//["oath","pea","eat","rain"]
void main() {
  Solution().findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], ["oath","pea","eat","rain"]);
}


// 트라이 라는 자료구조가 있다는 것을 처음 알았다.
// 문자열 검색에 특화되어있다고 한다.
class TrieNode {
  Map<String, TrieNode> children = {};
  String? word;
}

class Solution {

  List<List<String>>? _board;
  List<String> _result = [];

  List<String> findWords(List<List<String>> board, List<String> words) {

    // Trie 만들기
    TrieNode root = TrieNode();
    for (String word in words){
      TrieNode node = root;

      for(String char in word.split('')){
        if(node.children.containsKey(char)){
          node = node.children[char]!;
        } else {
          TrieNode newNode = TrieNode();
          node.children[char] = newNode;
          node = newNode;
        }
      }
      node.word = word;
    }

    _board = board;

    for (int row = 0; row < board.length; ++row){
      for (int col = 0; col < board[row].length; ++col){
        if (root.children.containsKey(board[row][col])){
          backtraking(row, col,root);
        }
      }
    }

    return _result;
  }

  void backtraking(int row, int col, TrieNode parent){
    String char = _board![row][col];
    TrieNode currNode = parent.children[char]!;

    // 매치된게 있는 걸 찾는다는데 아직 이해안됨.
    if (currNode.word != null){
      _result.add(currNode.word!);
      currNode.word = null;
    }

    // 한번 방문했던 곳에 # 추가
    _board![row][col] = '#';
    print(_board);
    List<int> rowOffset = [-1, 0, 1, 0];
    List<int> colOffset = [0, 1, 0, -1];

    for (int i = 0; i < 4; ++i){
      int newRow = row + rowOffset[i];
      int newCol = col + colOffset[i];

      if(newRow < 0 || _board!.length <= newRow || newCol < 0 || _board![0].length <= newCol){
        continue;
      }

      if (currNode.children.containsKey(_board![newRow][newCol])) {
        backtraking(newRow, newCol, currNode);
      }
    }

    _board![row][col] = char;

    // 최적화
    if(currNode.children.isEmpty){
      parent.children.remove(char);
    }
  }
}