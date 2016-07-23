class DebatesController < ApplicationController
  def show
    
    puts "Show Action Test"
    puts params
    puts params[:id]
    puts Debate.find(params[:id])
    @debate = Debate.find(params[:id])
    
  end

  def create
  end

  def edit
  end

  def index
    
   
   puts Debate.all
   @debates=Debate.all
    
  end
end
