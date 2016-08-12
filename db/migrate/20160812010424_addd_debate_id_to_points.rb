class AdddDebateIdToPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :debate_id, :integer
  end
end
