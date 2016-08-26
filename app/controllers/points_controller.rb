class PointsController < ApplicationController

 before_action :authenticate, only: [:create]
  
  def new
  end
  
  def test1
  
  end
  def create 
      
     
     puts params[:point][:parent_id].nil?
     
     debateID = params[:point][:debate_id]
     parentID = params[:point][:parent_id]
     
     parentDebate = Debate.find(debateID)
     
     
     newPoint = Point.new(point_params)
     newPoint.user_id = current_user.id
     newPoint.debate_id = (debateID)
     
    puts "side test"
    puts newPoint.side
    
    
    if newPoint.side != "neutral"
        
        newPoint.side = get_side(current_user, debateID)
        
    end
    
  
    
    if orphan?
    
        newPoint.save 
        parentDebate.points << newPoint
    
    else 
        parentPoint = Point.find(parentID)
        puts "not orphan"
        newPoint.save
        parentPoint.points << newPoint
    
    end
     
     if !request.referrer.nil?
        redirect_to request.referrer 
     end
     
  end
  
  def update
      
      if vote_params[:voting] == "true"
        
        puts "voting true"
        
        point_id = vote_params[:point_id]
        puts "updating"
        point = Point.find(point_id)
        vote = Vote.new(user_id: current_user.id)
        @badge_id = "#votebadge#{point_id}"
        @button_id = "#votebutton#{point_id}"
        
        puts @badge_id
        puts @button_id
        
        if vote.save
        
            point.votes << vote
            @votes_count = point.votes.count
            point.votes_count = @votes_count
            point.save
            
            @saved=true
            
        end
        
        respond_to do |format|
        
            format.js 
        end
    end
   
   

  end

  def destroy
   
    
   
   
  end

  def show
  end

  def edit
  end
end

private

def point_params
 
 params.require(:point).permit(:body, :votes, :side)
 
end

def vote_params
 
 params.require(:point).permit(:voting, :point_id)
 
end

def orphan?
  
  if params[:point][:parent_id] == "debate"
    
    true
  
  else 

    false
    
  end
  
end