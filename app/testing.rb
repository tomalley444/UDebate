



def heap_sort(arr)

    new_arr = heapify(arr)
    
    count = 0
    total =  arr.length - 1
    
    final_arr = []
    
    while !arr.empty?
    
        if arr.length == 1
           
           final_arr.push(arr.pop)
    
           return
            
        end
  
        root = arr[0]
        last = arr.last
        
        arr[0] = last
        arr[arr.length-1] = root
        
 
        
        
        final_arr.push(arr.pop)
        arr_end = arr.length - 1

        
        
        sift_down(arr,0,arr_end)
     
    
    end

    
    puts final_arr
    
    
    
    
end


def heapify(arr)
    
    arr_end = arr.length - 1
    
    count = arr_end
    
    while count >= 0
       
        sift_down(arr, count, arr_end)
    
        count = count -1 
        
    end
    
    return arr
    
end


def sift_down(arr, root, arr_end)
    
     left = left_child(root)
   
    right = right_child(root)

    
    if left_child(root) > arr_end
        
        return
    end
    
    
    
    swap = root
    
   
    if arr[swap] < arr[left]
     
        swap = left
       
    end
    
     
    if right <= arr_end
        if arr[swap] < arr[right]
            
            swap = right
        end
    end
    
    
    if swap == root
        
         
        prnt_heap(arr)
        
        return arr
       
    else    
        
        
        new_root = arr[swap]
        new_child = arr[root]
        
        
        
        
        arr[root] = new_root
        arr[swap] = new_child
        
       
        prnt_heap(arr)
        
        sift_down(arr, swap, arr_end)
        
        
         return arr
        
    end
    
   
    
end

def left_child(index)
    
    return 2*index +1
    
end

def right_child(index)
    
   
   return 2*index +2 


end

def parent(index)
    
    return ((index - 1)/2).floor 
    
    
end







heap_array =Array.new

heap_array << ["test",1]
heap_array << ["test",3]
heap_array << ["best",4]




def prnt_heap(arr)
    line = " "
    
    inter = 0
    
    count = 1
    goal = 1
    arr.each do |a|
    
      
        line += a.to_s+","
        
        if count == goal
           
           puts line
           line =""
            
            
            
            
            goal = goal*2
            count = 1
            
            
        else
            
            count +=1
            
        end
        
        
    end
    puts line
    
    puts "done"
    

end


testarray = [1,2,3,4,5,6,7,8,9]


testarray2 = [3,17,20,4,7,2,12,34,12,4,9,0,32,54,3,1,2,54,6,23,17,18,23,10,199]

prnt_heap(testarray2)
heap_sort(testarray2)



prnt_heap(new)