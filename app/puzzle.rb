def generate_parenthesis(n)
    
    count = 1
    arr = Array.new
    arr2 = Array.new
    arr.push("()")
    
    
    
        while count-1 != n do
            
            arr.each do |i|
                
                
                arr2.push(("(")+i+(")"))
                arr2.push(i+"()")
                arr2.push("()"+i)
                
                
                
            end
            
            arr = arr2.uniq
            arr2.clear
            puts "COUNT: #{count+1}"
            puts arr
            puts arr.size
            
            count+=1
        end
    
    
    
    
    
    
end

generate_parenthesis(5)

