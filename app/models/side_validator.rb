class SideValidator < ActiveModel::Validator
  def validate(record)
          puts "VALIDATOR TEST"
          puts record.pointable_type
          puts puts record.side
          puts Point.find(record.pointable_id).side
    if record.pointable_type == "Point" && record.side == Point.find(record.pointable_id).side
        
  
      puts "True"
      record.errors[:base] << "Can't rubuddle own side"
      
    end
        
        puts "FALSE"
  end
end
