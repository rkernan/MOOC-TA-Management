class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= session[:user_id] && User.find(session[:user_id])
    end
  end
end
