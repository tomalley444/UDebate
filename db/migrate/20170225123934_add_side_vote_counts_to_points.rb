class AddSideVoteCountsToPoints < ActiveRecord::Migration[5.0]
  def change
    
    add_column :points, :left_vote_count, :right_vote_count
    
  end
end
