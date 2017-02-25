class AddNumPointsToDebates < ActiveRecord::Migration[5.0]
  def change
    add_column :debates, :num_points, :integer
  end
end
