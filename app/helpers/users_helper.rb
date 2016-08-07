module UsersHelper

def participating?(user, debate_id)
        if user.nil?
            false
            
        elsif user.participations.exists?(debate_id: debate_id)
            true
        else
            false
        end
    
    
end

def get_side(user, debate_id)
  
     

        if participating?(user, debate_id)
             user.participations.find_by_debate_id(debate_id).side
        else
            nil
        end
   
end
    
end
