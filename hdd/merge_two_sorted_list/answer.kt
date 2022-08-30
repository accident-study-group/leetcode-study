/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
class Solution {
    fun mergeTwoLists(list1: ListNode?, list2: ListNode?): ListNode? {
        var mergedList = ListNode();
        var pointer : ListNode? = mergedList;

        var list1Pointer = list1;
        var list2Pointer = list2;

        while(list1Pointer != null && list2Pointer != null){
            if(list1Pointer.`val` <= list2Pointer.`val`){
                pointer?.next = list1Pointer;
                list1Pointer = list1Pointer?.next;
            } else {
                pointer?.next = list2Pointer;
                list2Pointer = list2Pointer?.next;
            }

            pointer = pointer?.next;
        }

        if(list1Pointer == null){
            pointer?.next = list2Pointer;
        } else {
            pointer?.next = list1Pointer;
        }

        return mergedList.next;
    }
}

// Runtime: 183 ms, faster than 94.19% of Kotlin online submissions for Merge Two Sorted Lists.
// Memory Usage: 35.4 MB, less than 88.84% of Kotlin online submissions for Merge Two Sorted Lists.