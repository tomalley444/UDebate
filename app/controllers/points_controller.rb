class PointsController < ApplicationController

 before_action :authenticate, only: [:create, :update, :dismiss, :dismiss_ajax, :flag, :remove, :remove_ajax]
  
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
     newPoint.status = "good"
     newPoint.flag_count = 0
     newPoint.dismissed = 0
     newPoint.left_vote_count2 = 0
     newPoint.right_vote_count2 = 0
     newPoint.votes_count = 0
    puts "side test"
    puts newPoint.side
    
    
    if newPoint.side != "neutral"
        
        newPoint.side = get_side(current_user, debateID)
        
    end
    
  
    
    if orphan?
    
        if newPoint.save 
            parentDebate.points << newPoint
            
            parentDebate.update(num_points: parentDebate.num_points + 1)
        else
            flash[:danger] = []  
            puts newPoint.errors.values
            newPoint.errors.values.each do |e|
               e.each do |f|
                flash[:danger] << f
                puts "CLASS"
                puts e.class
                puts e
                puts flash
                end
            
           
                
                
            end
            
             if !request.referrer.nil?
                redirect_to request.referrer 
                return 
            end
            
            
             
        end
        
        
    
    else 
        parentPoint = Point.find(parentID)
   
       if newPoint.save
            parentPoint.points << newPoint
            parentDebate.update(num_points: parentDebate.num_points + 1)
        else
           flash[:danger] = []  
            newPoint.errors.values.each do |e|
               e.each do |f|
                flash[:danger] << f
                puts "CLASS"
                puts e.class
                puts e
                puts flash
                end
            
           
                
                
            end
           if !request.referrer.nil?
             redirect_to request.referrer 
             return 
            end 
            
        end
    end
     
     if !request.referrer.nil?
        redirect_to request.referrer 
        return 
     end
     
  end
  
  def update
      puts "params test"
    puts params
    if vote_params[:voting] == "true"
        
        puts "voting true"
        
       
        
        point_id = vote_params[:point_id]
        puts "updating"
        point = Point.find(point_id)
        vote = Vote.new(user_id: current_user.id, point_id: point.id)
        @badge_id = "#votebadge#{point_id}"
        @left_badge_id = "#leftvotebadge#{point_id}"
        @right_badge_id = "#rightvotebadge#{point_id}"
        @button_id = "#votebutton#{point_id}"
       
        
        
        if vote.save
            vote.save
            point.votes << vote
           
           point.votes_count = point.votes.count
            if point.side == "neutral"
                puts "neutral point"
                puts point.side
                side = get_side(current_user, point.debate_id)
                if side =="left"
                    point.left_vote_count2 +=1
                
                elsif side == "right"
                    point.right_vote_count2 +=1
                    
                end
                
            
                    
                    update_weighted_vote(point)
                    @votes_count = point.weighted_vote_count
            else 
                 @votes_count = point.votes_count
                
            end
      
            
            @left_count = point.left_vote_count2
            @right_count = point.right_vote_count2
            
            point.save
            
            @saved=true
            
        end
        puts "errors:"
        puts vote.errors.full_messages
        respond_to do |format|
        
            format.js 
        end
    end
    
    
    puts "params test"
    puts params
    parms = test_params
    if parms[:expanding] == "true"
        
        
        @point = Point.find(parms[:point_id])
        @num_clicks = parms[:num_clicks]
        puts "numclicks"
        puts @num_clicks
        
        @subpoints = @point.points.take(@num_clicks)
        
        @debate_current_user = current_user
     
        
        
        @debate = Debate.find(parms[:debate_id])
        @side = get_side(@debate_current_user, @debate.id)
        @div_id = "pointpartial#{@point.id}"
        @showmore_div_id = "showmorepartial#{@point.id}"
        @points_size = @point.points.size
        
        puts "numclicks"
        puts @num_clicks
        puts "pointssize"
        puts @points_size
     
        
        respond_to do |format|
            format.js { render :action => "expand" }
            format.json { render :action => "expand" }
        end
    end

  end
  
  def flag
      parms = flag_params
      
      point = Point.find(parms)
    
      flag = Flag.new(user_id: current_user.id, point_id: point.id)
      
      if flag.save
          flag.save
          point.flags << flag
          flag_count = point.flags.count
          point.flag_count = flag_count
          point.save
          
          @flag_id = "#flagbutton#{point.id}"
          
          
          respond_to do |format|
            format.js { render :action => "flag" }
            format.json { render :action => "flag" }
        end
          
      end
      
      puts "errors:"
        puts flag.errors.full_messages
      
  
      puts "success"
       
       
  end
  
  def remove
      
      parms = flag_params
      point = Point.find(parms)
      

      
      body = point.body
      
      point.update(old_text: body)
      
      point.update(body: "removed" )
      point.update(status: "removed")
      
     
        
        
          if !request.referrer.nil?
            redirect_to request.referrer 
         end
         

  end
  
  
  def remove_ajax
      
      parms = flag_params
      point = Point.find(parms)
      

      body = point.body
      
      point.update(old_text: body)
      
      point.update(body: "removed" )
      point.update(status: "removed")
      
      
      
        respond_to do |format|
            
            
            debate_id = point.debate_id
            
            @debate = Debate.find(debate_id)
            @flagged_posts = Point.where("points.debate_id == #{debate_id} AND points.dismissed == 'f' AND points.flag_count >0 AND points.status != 'removed' " )
            format.js {render :action => "remove_ajax" }
            
            return
                 
        end
        
        
          if !request.referrer.nil?
            redirect_to request.referrer 
         end
         

  end
  
  
  def dismiss
      
      parms = flag_params
      point = Point.find(parms)
      body = point.body
      
      point.update(dismissed: 1)

      if !request.referrer.nil?
        redirect_to request.referrer 
     end
     
    puts "dismissed!"
  end
  
  def dismiss_ajax
      
      parms = flag_params
      point = Point.find(parms)
      body = point.body
      debate_id = point.debate_id
      point.update(dismissed: 1)
      
      respond_to do |format| 
          
          
          @debate = Debate.find(debate_id)
        @flagged_posts = Point.where("points.debate_id == #{debate_id} AND points.dismissed == 'f' AND points.flag_count >0 AND points.status != 'removed' " )
          format.js {render :action => 'points/dismiss_ajax'}
          return
    
        end

      if !request.referrer.nil?
        redirect_to request.referrer 
     end
     
    puts "dismissed!"
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

def test_params
    
    params.require(:point).permit(:expanding, :point_id, :showing, :num_clicks, :debate_id);
   
end

def flag_params
    
    params.require(:id)
   
end

def orphan?
  
  if params[:point][:parent_id] == "debate"
    
    true
  
  else 

    false
    
  end
  
end

def testblah
    
    @testblah = 1
    
end