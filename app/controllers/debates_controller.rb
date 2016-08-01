class DebatesController < ApplicationController
  def show
  
    @debate = Debate.find(params[:id])
    @participating = participating?(current_user, @debate)

    if @participating && logged_in?
      @side = get_side(current_user, @debate)
      @participation = current_user.participations.find_by_debate_id(@debate.id)
    end
    
  end

  def create
   
    Debate.create(debate_params)
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


