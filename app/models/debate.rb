class Debate < ActiveRecord::Base
      has_many :points, as: :pointable, dependent: :destroy 
end
