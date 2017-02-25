
class SessionsController < ApplicationController
  def new
  end
  
  def create
    
    user = User.find_by_email(params[:session][:email].downcase)

  
    if user && user.authenticate(params[:session][:password]) 
      
      log_in(user)
   
      puts logged_in?
      redirect_to current_user
     
    elsif !user
    
      flash.now[:danger] = "User not found, please create an account"
      render('new')
    
    else
    
    
    flash.now[:danger] = "incorrect password/email confirmation, please try again"
   
    render('new')
   
    end
  end
  
  def destroy
    log_out
    redirect_to root_path
  end
end
