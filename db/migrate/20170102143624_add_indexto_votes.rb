class AddIndextoVotes < ActiveRecord::Migration[5.0]
  def change
    add_index :votes, :id
  end
end
