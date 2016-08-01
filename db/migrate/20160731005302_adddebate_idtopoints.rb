class AdddebateIdtopoints < ActiveRecord::Migration[5.0]
  def change
    add column :points, :debate_id, "integer"
  end
end
