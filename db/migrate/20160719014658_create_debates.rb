class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.string :topic
      t.text :summary
      t.string :category

      t.timestamps null: false
    end
  end
end
