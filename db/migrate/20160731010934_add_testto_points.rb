class AddTesttoPoints < ActiveRecord::Migration[5.0]
  
   def change
    add_column :points, :test, "string"
   end
end
