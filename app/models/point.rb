class Point < ActiveRecord::Base
  belongs_to :pointable, polymorphic: true
  has_many :points, as: :pointable
  has_many :votes
  
  #validates_with SideValidator
  
end
