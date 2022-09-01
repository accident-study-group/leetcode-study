# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        return self.add(l1, l2)
    
    def add(self, l1: Optional[ListNode], l2: Optional[ListNode], rounded: int = 0) -> Optional[ListNode]:   
        if l1 is None and l2 is None and rounded is 0:
            return
        augend: ListNode = l1 or ListNode()
        addend: ListNode = l2 or ListNode()
        quotient, mod = divmod(augend.val + addend.val + rounded, 10)
        return ListNode(mod, self.add(augend.next, addend.next, quotient))
