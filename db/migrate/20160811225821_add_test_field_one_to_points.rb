class AddTestFieldOneToPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :test_field_one, :integer
  end
end
