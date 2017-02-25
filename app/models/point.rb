class Point < ActiveRecord::Base
  belongs_to :pointable, polymorphic: true
  
  has_many :points, as: :pointable
  has_many :votes
  has_many :flags
  
  
  #validates_with SideValidator
  
  validates :body, presence: true, length: {maximum: 1000}
  
end
