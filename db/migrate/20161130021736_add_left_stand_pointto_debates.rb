class AddLeftStandPointtoDebates < ActiveRecord::Migration[5.0]
  def change
    add_column :debates, :left_standpoint, :text
    add_column :debates, :right_standpoint, :text
    
  end
end
