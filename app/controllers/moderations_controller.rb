class ModerationsController < ApplicationController

    
    
    
    def moderations
       @user = current_user
       
       @debates_moderating = Debate.where(moderator_id: @user.id)
       
       puts @debates_moderating
       puts @debates_moderating.size
       puts @debates_moderating.class
       
       
       
    end
    
    def moderation
       @user = current_user 
       
       debate_id = params[:id]
       @debate = Debate.find(debate_id)
       
       @flagged_posts = Point.where("points.debate_id == #{debate_id} AND points.dismissed == 'f' AND points.flag_count >0 AND points.status != 'removed' " )
       "FLAGGED POSTS"
       puts "flagged posts size"
       puts @flagged_posts.size
    end
    
    def show_more
        
      
        debate_id = params[:id]
        @debate = Debate.find(debate_id)
       @flagged_posts = Point.where("points.debate_id == #{debate_id} AND points.dismissed == 'f' AND points.flag_count >0 AND points.status != 'removed' " )
        puts "yayayay"
        puts @flagged_posts.size
       
       respond_to do |format|
        
        format.js
           
        end 
        
        
    end

end
