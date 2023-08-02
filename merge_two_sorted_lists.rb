require 'pry'

# Definition for singly-linked list.
 class ListNode
     attr_accessor :val, :next
     def initialize(val = 0, _next = nil)
         @val = val
         @next = _next
    end
 end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  return nil if !list1 && !list2
  return list1 if !list2
  return list2 if !list1

  current1 = list1
  current2 = list2
  list_pointer = nil
  head = nil
  
  while current1 || current2
    if (current1 && !current2) || (current1 && current1.val <= current2.val)
      if list_pointer.nil?
        list_pointer = head = current1
      else 
        list_pointer.next = current1
        list_pointer = list_pointer.next
      end
      current1 = current1.next
    elsif (!current1 && current2) || (current2 && current1.val > current2.val)
      if list_pointer.nil?
        list_pointer = head = current2
      else 
        list_pointer.next = current2
        list_pointer = list_pointer.next
      end
      current2 = current2.next
    end 
    list_pointer.next = nil
  end 
  head
end

def test_head_node(head_node)
  while head_node&.val
    p head_node.val
      head_node = head_node.next
  end  
end

list1 = ListNode.new(1, ListNode.new(2, ListNode.new(3)))
list2 = ListNode.new(1, ListNode.new(2, ListNode.new(3)))

test_head_node(merge_two_lists(list1, list2)) # 1 1 2 2 3 3
  
  
list3 = ListNode.new(1, ListNode.new(2, ListNode.new(3)))
list4 = ListNode.new(4, ListNode.new(5, ListNode.new(6)))

test_head_node(merge_two_lists(list3, list4)) # 1 2 3 4 5 6 
