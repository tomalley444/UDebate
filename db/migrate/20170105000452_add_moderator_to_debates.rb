class AddModeratorToDebates < ActiveRecord::Migration[5.0]
  def change
    add_column :debates, :moderator, :string
  end
end
