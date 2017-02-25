class VoteSideValidator < ActiveModel::Validator
  def validate(record)
          puts "VOTE VALIDATOR TEST"
          
          
          point = Point.find(record.point_id)
          debate_id = point.debate_id
          
          participation = Participation.where("user_id == #{record.user_id} AND debate_id == #{debate_id}").take
      
          puts "part test"
          puts participation.side
          user_side = participation.side
          point_side = point.side
          
    if ((user_side != point_side) && (point_side != "neutral"))
        
  
      puts "True"
      record.errors[:base] << "Can't rubuddle own side"
      
    end
        
        puts "FALSE"
  end
end
