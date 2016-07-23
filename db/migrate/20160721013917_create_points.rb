class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.text :body
      t.integer :votes
      t.references :pointable, index: true, polymorphic: true

      t.timestamps null: false
    end
  end
end
