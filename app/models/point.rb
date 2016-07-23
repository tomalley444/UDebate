class Point < ActiveRecord::Base
  belongs_to :pointable, polymorphic: true
  has_many :points, as: :pointable
end