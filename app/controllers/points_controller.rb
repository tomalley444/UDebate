class PointsController < ApplicationController
  def new
  end
  
  def create 
   
  
     if orphan?
     
     puts params[:point]
     puts params[:debate_id]
    #testDebate = Debate.find(params[:debate_id]).points.create(params[:point])
    testDebate = Debate.find(params[:debate_id]).points.create(body: params[:point][:body])
     puts "testTEST"
     puts testDebate
     
     
     else 
      Point.find(params[:parent_id]).points.create(body: params[:body])
      redirect_to request.referrer
      
     end
     
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