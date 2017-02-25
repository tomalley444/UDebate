class Debate < ActiveRecord::Base
      
      before_save { 
            self.num_participants ||= 0
            self.num_points ||= 0
            
            
            
      }
      
      
      has_many :points, as: :pointable, dependent: :destroy 
      has_many :participations
     

end
