class SessionsController < ApplicationController
  def login
    # login form
  end

  def authenticate
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:userid] = user.id
      redirect_to :action => 'index', :controller => 'users'
    else
      render 'login'
    end
  end

  def logout
    session[:userid] = nil
    redirect_to :action => 'login', :controller => 'sessions'
  end
end
