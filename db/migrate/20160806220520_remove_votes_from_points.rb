class RemoveVotesFromPoints < ActiveRecord::Migration[5.0]
  def change
    
    remove_column :points, :votes
    
  end
end
