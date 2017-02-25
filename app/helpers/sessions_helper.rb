module SessionsHelper
    
   
    
    def log_in(user)
        session[:user_id]=user.id
    
        
    end
    
    def log_out
        session.delete(:user_id)
        @current_user = nil

    end
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
     
    end
    
    def logged_in?
      #  puts "loggedin?"
       # puts @current_user1
        
        !current_user.nil?
    end

    def authenticate
   
        if !logged_in?
            flash[:danger] = "Please log in."
            redirect_to login_path
             
        else

       
        end
    end

end
