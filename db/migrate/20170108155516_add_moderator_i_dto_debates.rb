class AddModeratorIDtoDebates < ActiveRecord::Migration[5.0]
  def change
    add_column :debates, :moderator_id, :integer
  end

end
