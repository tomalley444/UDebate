class ParticipationsController < ApplicationController

before_action :authenticate
def create
    Participation.create(user_id: current_user.id, debate_id: params[:debate_id], side:  params[:side])
    parentDebate = Debate.find(params[:debate_id])
    puts parentDebate
    parentDebate.update(num_participants: parentDebate.num_participants + 1)
    redirect_to request.referrer 
    
    
    debate = Debate.find(params[:debate_id])
    
    update_weighted_votes(debate)
    

end

def update
        
        
        participation = Participation.find(switch_params)
        debate = Debate.find(participation.debate_id)
        if participation.side == "left"
        participation.update(side: "right")
        update_weighted_votes(debate)
        redirect_to request.referrer 

        
        else
        participation.update(side: "left")
        update_weighted_votes(debate)
        redirect_to request.referrer 
         
        end
end

private

def switch_params
    params.require(:id)
end
end
