/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */

class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    // 둘중 하나라도 null이 아닐 때
    if(list1 != null && list2 != null){
      ListNode mergedList = ListNode();
      ListNode? pointer = mergedList;

      while(list1 != null && list2 != null){
        if(list1.val <= list2.val){
          pointer?.next = list1;
          list1 = list1.next;
        } else {
          pointer?.next = list2;
          list2 = list2.next;
        }

        pointer = pointer?.next;
      }

      if(list1 == null){
        pointer?.next = list2;
      } else {
        pointer?.next = list1;
      }
      return mergedList.next;
    } else {
      if(list1 == null){
        return list2;
      }
      return list1;
    }
  }
}
//Runtime: 336 ms, faster than 100.00% of Dart online submissions for Merge Two Sorted Lists.
// Memory Usage: 141.8 MB, less than 100.00% of Dart online submissions for Merge Two Sorted Lists.