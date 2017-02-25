class AddNumParticipantsToDebates < ActiveRecord::Migration[5.0]
  
  def change
    add_column :debates, :num_participants, :integer
    
  end


end
