class DebatesController < ApplicationController
  def show
  
    @debate = Debate.find(params[:id])
    @participating = participating?(current_user, @debate.id)

    if @participating && logged_in?
      @side = get_side(current_user, @debate.id)
      @participation = current_user.participations.find_by_debate_id(@debate.id)
      @debate_current_user = current_user
      
      
    end
    
  end

  def create
   
    newDebate = Debate.new(debate_params)
    newDebate.update(owner_id: current_user.id)
    
    puts "OWNER ID TEST"
    puts newDebate.owner_id
    newDebate.save
    
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
  
  private

    def debate_params
      params.require(:debate).permit(:topic, :summary, :category)
    end
end


