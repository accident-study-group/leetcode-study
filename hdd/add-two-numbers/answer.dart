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
    int carry = 0;
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


// Runtime: 672 ms, faster than 50% of Dart online submissions for Add Two Numbers.
// Memory Usage: 148.1 MB, less than 100.00% of Dart online submissions for Add Two Numbers.