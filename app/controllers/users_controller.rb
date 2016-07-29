class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def show
        @user= User.find_by_id(params[:id])
    end
    
    def new
        @user = User.new
    end
    
    def create
        User.create(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    end
        

end
