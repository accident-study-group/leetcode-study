/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {

    // 테스트케이스에 둘 중 하나가 null로 들어오는 일이 별로 없는지 넣었을 때 퍼포먼스가 더 적게 나오는 것 같음.
    // 실제로 사용하는 코드라면 꼭 넣을듯.
//        if (l1 == null) return l2
//        if (l2 == null) return l1

    ListNode sumNode = ListNode();
    ListNode? pointer = sumNode;

    while(pointer != null){
      int sum = (l1?.val ?? 0)+ (l2?.val ?? 0) + pointer.val;
      pointer.val = sum % 10;

      // 선호하지 않는 방법이지만, 메모리 사용량 줄이기 + 파라미터를 다시 사용할 일이 없어서
      // 파라미터로 받은 링크드리스트를 바로 사용.
      if((l1?.next != null || l2?.next != null) || sum >= 10){
        pointer.next = ListNode(sum ~/ 10);
        l1 = l1?.next;
        l2 = l2?.next;
      }

      pointer = pointer.next;
    }

    return sumNode;
  }
}

// 성능이 너무 왔다갔다함... 메로리가 최고였다가 ... 속도가 최고였다가... ㅠ

// Runtime: 672 ms, faster than 66% of Dart online submissions for Add Two Numbers.
// Memory Usage: 148.1 MB, less than 100.00% of Dart online submissions for Add Two Numbers.


// Runtime: 607 ms, faster than 100.00% of Dart online submissions for Add Two Numbers.
// Memory Usage: 152.4 MB, less than 66.67% of Dart online submissions for Add Two Numbers.