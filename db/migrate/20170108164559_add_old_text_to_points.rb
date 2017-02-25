class AddOldTextToPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :old_text, :text
  end
end
