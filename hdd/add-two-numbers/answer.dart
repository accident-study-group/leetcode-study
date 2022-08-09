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

    ListNode? tempNode1 = l1;
    ListNode? tempNode2 = l2;
    ListNode? pointer = sumNode;

    while(pointer != null){
      int sum = (tempNode1?.val ?? 0)+ (tempNode2?.val ?? 0) + carry;
      carry = 0;

      if(sum >= 10){
        carry = 1;
        sum -= 10;
      }

      pointer?.val = sum;


      tempNode1 = tempNode1?.next;
      tempNode2 = tempNode2?.next;

      if(tempNode1 != null || tempNode2 != null || carry != 0){
        pointer?.next = ListNode();
      }

      pointer = pointer?.next;
    }

    return sumNode;
  }
}


// Runtime: 790 ms, faster than 16.67% of Dart online submissions for Add Two Numbers.
// Memory Usage: 154.6 MB, less than 50.00% of Dart online submissions for Add Two Numbers.