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
    
    def get_participating_debates (user)
       
       debate_ids = []
       
       user.participations.each do |p|
           
           debate_ids << p.debate_id
           
        end
        
        debates = []
        
        debate_ids.each do |d|
            debates << Debate.find(d)
        end
        
        puts debates
        
        return debates
    end
    
    
end
