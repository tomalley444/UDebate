class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.references :user, foreign_key: true
      t.references :debate, foreign_key: true
      t.string :side

      t.timestamps
    end
  end
end
