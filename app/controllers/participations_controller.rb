class ParticipationsController < ApplicationController
    
def create
    Participation.create(user_id: current_user.id, debate_id: params[:debate_id], side:  params[:side])
end

def update
    
        participation = Participation.find(switch_params)
        if participation.side == "left"
        participation.update(side: "right")
        
        else
        participation.update(side: "left")
         
        end
end

private

def switch_params
    params.require(:id)
end
end
