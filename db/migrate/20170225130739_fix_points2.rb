class FixPoints2 < ActiveRecord::Migration[5.0]
  def change
    
    add_column :points, :left_vote_count2, :integer
    add_column :points, :right_vote_count2, :integer
    
  end
end
