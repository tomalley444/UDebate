class RemoveFlagsFromPoints < ActiveRecord::Migration[5.0]
  def change
    
    remove_column :points, :flags
    add_column :points, :flag_count, :integer
  end
end


