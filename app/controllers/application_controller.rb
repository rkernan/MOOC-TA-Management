class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl
  
  helper_method :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to view this page."
      store_location
      redirect_to :login
      return false
    end
  end

  def require_specific_user(user)
    unless current_user && current_user == user
      flash[:notice] = "You must be logged in as a specific user to change this page."
      if current_user
        redirect_to users_url
      else
        store_location
        redirect_to :login
      end
      return false
    end
  end

  def require_professor
    unless current_user && current_user.type == "Professor"
      flash[:notice] = "You must be logged in as a Professor to view this page."
      if current_user
        redirect_to users_url
      else
        store_location
        redirect_to :login
      end
      return false
    end
  end

  def require_teaching_assistant
    unless current_user && current_user.type == "TeachingAssistant"
      flash[:notice] = "You must be logged in as a Teaching Assistant to view this page."
      if current_user
        redirect_to users_url
      else
        store_location
        redirect_to :login
      end
      return false
    end
  end

  def require_no_user
    if current_user
      flash[:notice] = "You must not be logged in to view this page."
      redirect_to users_url
      return false
    end
  end

  def store_location
    session[:return_to] =
      if request.get?
        request.url
      else
        request.referer
      end
  end

  def url_back_or_default(default)
    url =
      if session[:return_to]
        session[:return_to]
      else
        default
      end
    session[:return_to] = nil
    return url
  end
end
