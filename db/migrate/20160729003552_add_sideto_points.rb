class AddSidetoPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :side, "string"
  end
end
