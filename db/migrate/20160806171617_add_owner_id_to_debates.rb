class AddOwnerIdToDebates < ActiveRecord::Migration[5.0]
  def change
    add_column :debates, :owner_id, :integer
  end
end
