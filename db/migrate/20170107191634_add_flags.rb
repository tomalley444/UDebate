class AddFlags < ActiveRecord::Migration[5.0]
  def change
    
    create_table :flags do |t|
      t.references :point
      t.integer :user_id
 
      t.timestamps
      
    end
      
      
  end
end
