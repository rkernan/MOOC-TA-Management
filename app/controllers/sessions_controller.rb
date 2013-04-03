class SessionsController < ApplicationController
  def login
    # login form
  end

  def authenticate
    @user = User.authenticate(params[:email], params[:password])
    if @user
      # update login times
      current_datetime = DateTime.now
      if !@user.first_login_at
        @user.update_column(:first_login_at, current_datetime)
        @user.first_login_at = current_datetime
      end
      @user.update_column(:last_login_at, current_datetime)
      # log user in
      session[:user_id] = @user.id
      session[:user_type] = @user.type
      redirect_to :action => 'index', :controller => 'users'
    else
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_type] = nil
    redirect_to :action => 'login', :controller => 'sessions'
  end
end
