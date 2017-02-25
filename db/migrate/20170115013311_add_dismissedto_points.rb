class AddDismissedtoPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :dismissed, :boolean
  end
end
