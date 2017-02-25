class AddWeightedVoteToPoints < ActiveRecord::Migration[5.0]
  def change
    
    add_column :points, :weighted_vote_count, :integer
    
  end
end
