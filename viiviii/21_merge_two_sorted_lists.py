# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        if list1 is None or list2 is None:
            return list1 if list2 is None else list2
        start, tmp = (list1, list2) if list1.val < list2.val else (list2, list1)
        current = start
        while current.next:
            previous = current
            current = current.next
            smaller = self.less_than(tmp, end=current.val)
            if smaller:
                bigger = smaller.next
                smaller.next = current
                previous.next = tmp
                tmp = bigger
        if tmp is not None:
            current.next = tmp
        return start
    
    def less_than(self, node: ListNode, end: int) -> Optional[ListNode]:
        if node is None or node.val >= end:
            return None
        if node.next is None or node.next.val >= end:
            return node
        return self.less_than(node.next, end)
