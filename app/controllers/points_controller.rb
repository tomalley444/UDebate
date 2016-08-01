class PointsController < ApplicationController
 before_action :authenticate, only: [:create]
  
  def new
  end
  
  def create 
  
  
     if orphan?
       
             #Debate.find(params[:debate_id]).points.create(body: params[:point][:body], votes: params[:point][:votes], side: get_side(current_user, nil, params[:debate_id]), user_id: current_user.id)
             Debate.find(params[:debate_id]).points.create(body: params[:point][:body], votes: params[:point][:votes], side: get_side(current_user, nil, params[:debate_id]), user_id: current_user.id, point_debate_id: params[:debate_id])


     puts "ORPHANNNNNNNNNNN"
     else 
      parent_point = Point.find(params[:parent_id])
      parent_point.points.create(body: params[:body], votes: params[:votes], side: get_side(current_user, nil,  parent_point.point_debate_id), user_id: current_user.id, point_debate_id: parent_point.debate_id)
      
      puts "NOT ORPHANNNNNNNNNNNNNN"
     end
     
     redirect_to request.referrer 
     
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

def orphan?
  
  if params.key?(:point)
    puts "PARENT - Debate" 
    true
  
  else 
    puts "PARENT - Comment"
    false
    
  end
  
end