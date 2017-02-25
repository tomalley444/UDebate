class Vote < ApplicationRecord
    
    belongs_to :point
    #validates :user_id, uniqueness: {scope: :point_id}
    validates :user_id, presence: true
    
    validates_with VoteSideValidator
    
   
    
end
