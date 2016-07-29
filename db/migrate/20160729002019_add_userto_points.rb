class AddUsertoPoints < ActiveRecord::Migration[5.0]
  def change
    add_reference :points, :user
    
  end
end
