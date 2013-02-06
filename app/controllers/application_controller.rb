class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user

  # helper method for getting the currently logged in user
  def current_user
    if session[:userid]
      @current_user ||= User.find(session[:userid])
    end
  end
end
