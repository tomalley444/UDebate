class AddFlagstoPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :flags, :integer
  end
end
