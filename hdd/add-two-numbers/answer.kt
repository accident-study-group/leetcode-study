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
    fun addTwoNumbers(l1: ListNode?, l2: ListNode?): ListNode? {

        // 테스트케이스에 둘 중 하나가 null로 들어오는 일이 별로 없는지 넣었을 때 퍼포먼스가 더 적게 나오는 것 같음.
        // 실제로 사용하는 코드라면 꼭 넣을듯.
//        if (l1 == null) return l2
//        if (l2 == null) return l1

        var sumNode : ListNode = ListNode();
        var pointer : ListNode? = sumNode;
        var l1Pointer : ListNode? = l1;
        var l2Pointer : ListNode? = l2;

        while(pointer != null){
            val sum : Int = (l1Pointer?.`val` ?: 0) + (l2Pointer?.`val` ?: 0) + pointer!!.`val`;
            pointer.`val` = sum % 10;

            if((l1Pointer?.next != null || l2Pointer?.next != null) || sum >= 10){
                pointer.next = ListNode(sum / 10);
                l1Pointer = l1Pointer?.next;
                l2Pointer = l2Pointer?.next;
            }

            pointer = pointer.next;
        }

        return sumNode;
    }
}

// Runtime: 235 ms, faster than 95.52% of Kotlin online submissions for Add Two Numbers.
// Memory Usage: 41.8 MB, less than 94.66% of Kotlin online submissions for Add Two Numbers