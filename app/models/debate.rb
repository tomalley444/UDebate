class Debate < ActiveRecord::Base
      has_many :points, as: :pointable, dependent: :destroy 
      has_many :participations

end
