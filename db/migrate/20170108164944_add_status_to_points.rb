class AddStatusToPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :status, :string
  end
end
