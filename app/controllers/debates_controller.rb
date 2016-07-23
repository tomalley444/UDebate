class DebatesController < ApplicationController
  def show
    
    puts "Show Action Test"
    puts params
    puts params[:id]
    puts Debate.find(params[:id])
    @debate = Debate.find(params[:id])
    
  end

  def create
    Debate.create(topic: params[:debate][:topic], summary: params[:debate][:summary], category: params[:debate][:category])
    redirect_to debates_path
  end
  
  def new
    @debate = Debate.new
  end

  def edit
  end

  def index
    
   
   puts Debate.all
   @debates=Debate.all
    
  end
end
