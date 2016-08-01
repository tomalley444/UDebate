module UsersHelper

def participating?(user, debate, debate_id=nil)
    if debate_id.nil?
        if user.participations.exists?(debate_id: debate.id)
            true
        else
            false
        end
    else
        if user.participations.exists?(debate_id: debate_id)
            true
        else
            false
        end
    end
    
end

def get_side(user, debate,debate_id=nil)
    if debate_id.nil?
        if participating?(user, debate)
            user.participations.find_by_debate_id(debate.id).side
        else
            nil
        end
   
    
    else
        if participating?(user, nil, debate_id)
            user.participations.find_by_debate_id(debate_id).side
        else
            nil
        end
    end
end
    
end
