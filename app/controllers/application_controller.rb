class ApplicationController < ActionController::Base
    # make the below methods available in our view templates:  
    helper_method :current_user, :logged_in?, :default_background_url
    #Action to retrieve and puts current user id if logged in
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    def logged_in?
      !!current_user
    end
    #Action to redirect to Login view if you're NOT logged in   
    def authorize
      redirect_to new_session_path unless logged_in?
    end
    #Background image
    def default_background_url
      "https://images.unsplash.com/photo-1507924267304-e51febff7b1c?ixlib=rb-0.3.5&s=0c0892192a76e451e259e2c904b2ea81&auto=format&fit=crop&w=2508&q=80"
    end 
  
  end