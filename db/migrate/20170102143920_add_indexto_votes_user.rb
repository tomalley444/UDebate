class AddIndextoVotesUser < ActiveRecord::Migration[5.0]
  def change
    add_index :votes, :user_id
  end
end
