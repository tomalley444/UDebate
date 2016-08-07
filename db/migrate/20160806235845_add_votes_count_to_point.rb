class AddVotesCountToPoint < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :votes_count, :integer
  end
end
