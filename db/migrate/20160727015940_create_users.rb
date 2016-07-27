class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :users, :email
    add_index :users, :user_id
  end
end
