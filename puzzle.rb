# Definition for singly-linked list.
class ListNode
     attr_accessor :val, :next
     def initialize(val)
         @val = val
        @next = nil
     end
end

head1 = ListNode.new(1)
head1.next=ListNode.new(2)
#head1.next.next=ListNode.new(3)
#head1.next.next.next=ListNode.new(4)
#head1.next.next.next.next=ListNode.new(5)



def print_list(head)
    
    current_node = head
    puts "worked"
  
    if current_node.next == nil
        puts current_node.val
    
    
    else
        while current_node.next != nil do
            
            puts current_node.val
            current_node = current_node.next
            
        end
    end

end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}

def remove_nth_from_end(head, n)
    
    current_node = head
    
    prev_node = nil
    
    puts "current_node"    
    puts current_node.val
    while current_node != nil do
        puts "next val"
      
        temp_node = current_node
        testvar = 0
       (1..n-1).each do 
           testvar +=1
           temp_node = temp_node.next
          
       end 
       puts"testvar"
       puts testvar
      puts "temp_node val"
      puts temp_node.val
      
      
       if temp_node.next == nil
          puts "winner"
          
          
           if prev_node == nil
               head = current_node.next
               return head
           end 
           prev_node.next = current_node.next
          
           return head
        
           
        end
       prev_node = current_node
       current_node = current_node.next
       puts "end of loop"
       puts current_node.val
        
       
        
   
    end



    
end

print_list(remove_nth_from_end(head1,2))