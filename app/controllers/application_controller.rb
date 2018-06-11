class ApplicationController < ActionController::Base
    # make the below methods available in our view templates:  
    helper_method :current_user, :logged_in?
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
      
    def authorize
      redirect_to new_session_path unless logged_in?
    end
  end