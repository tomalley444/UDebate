class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def show
        @user= User.find_by_id(params[:id])
        
        
        @participating_debates = get_participating_debates(@user)
        
        
    end
    
    def profile
    
        @user = current_user
        
        
    
        
    end
    
    
    def new
        @user = User.new
    end
  
    def create
        @user = User.create(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
        
        if @user.save
          log_in(@user)
          current_user
          
          redirect_to root_path
        else
          render 'new'
        end
    end
        

end
