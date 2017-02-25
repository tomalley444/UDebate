module DebatesHelper
    
    def test_mem2
       
       @testmem2 = 3
       puts "testmem2 define"
        
    end
    
    def get_test_mem
       
       puts "testmem2get"
       
       @testmem2 
        
    end
    
    def get_votes(debate, side)
        
        debate.points.each do |p|
            
            
            
        end
        
    end
    
    def get_point_votes (point,side,count)
        
       
        
        if point == nil
            return
        end
        
        if point.side == side
            count = count + point.votes.count
        end
        
       
        
        point.points.each do |p|
                  
            count = get_point_votes(p,side,count)

        end
        
        puts "COUNT RETURNED"
        puts count
        return count
        
        
        
    end
    
    def get_debate_votes(debate,side)
        
        count = 0
        
        debate.points.each do |p|
           
            count += get_point_votes(p,side,0)   
            
        end
        
        return count
        
        
    end
    
    def debate_sort(debates,sortation,order)
        
        if order == "ascn"
        
            if sortation == "participation"
                sorted_debate = debates.sort {|x,y| y.num_participants <=> x.num_participants}
                
            elsif sortation == "points"
                sorted_debate = debates.sort {|x,y| y.num_points <=> x.num_points}
                
            elsif sortation == "date"
                sorted_debate = debates.sort {|x,y| x.created_at <=> y.created_at}
                
                puts "sorted - date"
       
            end
        
        elsif order == "dscn"
        
            if sortation == "participation"
                sorted_debate = debates.sort {|x,y| x.num_participants <=> y.num_participants}
                
            elsif sortation == "points"
                sorted_debate = debates.sort {|x,y| x.num_points <=> y.num_points}
                
            elsif sortation == "date"
                
                
                sorted_debate = debates.sort {|x,y| y.created_at <=> x.created_at}
                
                puts "sorted - date"
       
            end
   
        
        end
        return sorted_debate
        
    end
    
    def get_point_flags(point, count)
        
        if point == nil
            return
        end
        
        if point.flag_count > 0 && point.dismissed == false
            count = count + 1
            puts "flagged"
            puts count
        
        end
        puts "yes"
        
        point.points.each do |p|
            
            puts "bles"
            count = get_point_flags(p,count)
        end
        puts "final count"
        puts count
        return count
        
    end
    
    def get_debate_flags(debate)
        count = 0
        
        debate.points.each do |p|
            
            count += get_point_flags(p,0)
            
            
        end
        
        puts "getting debate flags:"
        puts count 
        return count
        
    end
    
    def get_flagged_posts_num(debate)
        debate_id = debate.id
        @flagged_posts = Point.where("points.debate_id == #{debate_id} AND points.dismissed == 'f' AND points.flag_count >0 AND points.status != 'removed' " )    
        
        return @flagged_posts.size
    end
    
    
    def count_user_points(debate, user)
        
        
    
        user_points = Point.where("points.user_id ==#{user.id} AND points.debate_id ==#{debate.id}")
        if !user_points.nil?
            return user_points.size
        else
            return 0
        end
        
        
        
        
    end
    
    
    
    
    
    
end
