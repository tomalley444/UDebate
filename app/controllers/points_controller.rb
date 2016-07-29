class PointsController < ApplicationController
 
  
  def new
  end
  
  def create 
    puts "votestest"
    puts params
     if orphan?
       
       puts "SESSSION IDDDDDDDDDDDDDDDD"
      puts current_user.id
      
      Debate.find(params[:debate_id]).points.create(body: params[:point][:body], user_id: current_user.id)
    
     
     else 
       
      Point.find(params[:parent_id]).points.create(body: params[:body], votes: params[:votes], side: params[:side], user_id: session[:user_id])
      
      
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


def orphan?
  
  if params.key?(:point)
    puts "PARENT - Debate" 
    true
  
  else 
    puts "PARENT - Comment"
    false
    
  end
  
end