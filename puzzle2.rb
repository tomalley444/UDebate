# @param {String} s
# @return {Boolean}


s1 = "()[]{}"

s2 = "([])"



s3 = "(({[()]}))"

s4 = "()[(){}]"







def is_valid(s)
    temp = Array.new()
    s.each_char do |i|
        puts "si:#{s[i]}"
        
        
        
        if s[i] == "(" || s[i] =="{" || s[i] == "["
           
           puts "opener"
           temp.push(s[i])
           
        
        elsif s[i] == ")" || s[i] =="}" || s[i] == "]"
        
            if s[i] == ")"
                opposite = "("
            elsif s[i] == "}"
                opposite = "{"
            elsif s[i] == "]"
                opposite = "["
            
            end
            puts "closer"
            puts "temp.last#{temp.last}"
            if opposite == temp.last
                temp.pop()
            
            puts "match"
            else
                return false
            end
            
        else
            return false
        end
        
    end
    
    puts temp.size
    
    if temp.size>0
        return false
    else
        
        return true
    end
end


puts is_valid("()[()]")