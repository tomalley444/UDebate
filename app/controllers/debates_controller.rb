class DebatesController < ApplicationController
  
  before_action :authenticate, only: [:create]
  def show
  
    @debate = Debate.find(params[:id])
    
    @debate_points = @debate.points.order(:votes_count).reverse_order
    
    
    
    @participating = participating?(current_user, @debate.id)
    @num_left_votes = get_debate_votes(@debate, "left")
    @num_right_votes = get_debate_votes(@debate, "right")
    mults = calculate_multipliers(@debate)
    @left_mult = mults[:left_mult]
    @right_mult = mults[:right_mult]
    
    if !@participating  && logged_in?
      @debate_current_user = current_user
        
    elsif @participating && logged_in?
      @side = get_side(current_user, @debate.id)
      @participation = current_user.participations.find_by_debate_id(@debate.id)
      @debate_current_user = current_user
      puts "CURRENT USER"
      puts @debate_current_user
      
      
    end
    
    debate_neutrals = @debate_points.where("points.side = 'neutral'")
    
    
    
    
    puts "NETRAL DEBATES:"
    debate_neutrals.each do |p|
      
      puts p.body
      
    end
    
  end

  def create
   
    newDebate = Debate.new(debate_params)
    newDebate.update(owner_id: current_user.id)
    newDebate.update(moderator: current_user.name)
    newDebate.update(moderator_id: current_user.id)
    
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
  
  def test1
    
    @point = Point.find(params[:conceal])
    @debate = Debate.find(params[:id])
    @side = get_side(current_user, @debate.id)
    @debate_current_user =current_user
   
     
    respond_to do |format|
      
      format.js
      
    end
  end

  def index
   
  @sortation = params[:sortation]
  @order = params[:order]
  
  
  if @sortation == nil
    @sortation = "date"
  end
  
  if @order == nil
    @order = "ascn"
  end
  
  @debates=Debate.all
  @debates = @debates.to_ary
  
  @debates = debate_sort(@debates,@sortation,@order)
  
  if params[:showing].nil?

     @debates = @debates.slice(0,3)
     @showing = 0
  
  else
    
    @showing = params[:showing].to_i
    puts params[:showing]
    @debates = @debates.slice(@showing,3)
    
  
    
  end
  
  
  
    
  end
  
  private

    def debate_params
      params.require(:debate).permit(:debate,:topic, :summary, :category, :left_standpoint, :right_standpoint)
    end
end


