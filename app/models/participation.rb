class Participation < ApplicationRecord

  belongs_to :user
  belongs_to :debate
  
  
  validates :user, uniqueness: {scope: :debate} 
  
end
