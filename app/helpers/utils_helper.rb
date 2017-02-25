module UtilsHelper
    
    
    


def update_weighted_votes(debate)
    
    neutral_points = debate.points.where(side: "neutral")
    mults = calculate_multipliers(debate)
    
    
    neutral_points.each do |p|
        
        if p.left_vote_count2 == nil
            p.update(left_vote_count2:0)
        end
        
        if p.right_vote_count2 == nil
            p.update(right_vote_count2:0)
        end
        
        new_count = calculate_weighted_vote(p,mults)  
        p.update(weighted_vote_count: new_count)
    end
    
end


def update_weighted_vote(point)
    
    debate= Debate.find(point.debate_id)
    mults = calculate_multipliers(debate)
   
    new_count = calculate_weighted_vote(point,mults)  
    point.update(weighted_vote_count: new_count)
    
end




def calculate_weighted_vote(point,mults)

    base_vote_count = point.votes_count
    
    
    
    base_left_votes_count = point.left_vote_count2
    base_right_votes_count = point.right_vote_count2
    puts "mults!!!!"
    puts mults
    puts mults[:left_mult]
    puts mults[:right_mult]
    puts base_left_votes_count
    puts base_left_votes_count
    weighted_vote_count = base_left_votes_count*mults[:left_mult] + base_right_votes_count*mults[:right_mult]
    
    return weighted_vote_count
    
end

def calculate_multipliers(debate)

    left_count = debate.participations.where(side: "left").size
    right_count = debate.participations.where(side: "right").size
    
    if left_count == 0 || right_count == 0
        
        mults = {left_mult: (1), right_mult:  (1)}
        return mults
        
    end
    
    
    if left_count > right_count
        mults = {left_mult: (1), right_mult:  (left_count/right_count)}
        
    end
    
    if right_count > left_count
    
        mults = {left_mult: (right_count/left_count), right_mult: 1}
    
    end
    
    if right_count == left_count

         mults = {left_mult: 1, right_mult: 1}

    end


    return mults
    
    
end



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



end
