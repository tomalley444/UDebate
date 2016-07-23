class PointsController < ApplicationController
  def new
  end
  
  def create 
   
    puts params
    puts params[:parent_id]
    Point.find(params[:parent_id]).points.create(body: params[:body])
    redirect_to request.referrer
  end
  
  

  def destroy
  end

  def show
  end

  def edit
  end
end


def find_parent_type
  
  if params [:commentable_id]
    puts "PARENT - COMMENT" 
  
  
  else params[:debate_id]
    puts "PARENT - DEBATE"
    
  end
  
end