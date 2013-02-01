class UsersController < ApplicationController

  # This method gets called when we go to /users/index
  # By CONVENTION, Rails automatically pulls up the corresponding
  # index.html.erb file and populates it with whatever data we return
  # from this method.
  def index
    @users = User.all
  end

end
