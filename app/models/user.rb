class User < ActiveRecord::Base

  # attr_accessible sets ups getters and setters for each variable.
  # it IS possible to check for valid assignment to these fields 
  # we'll get into that later.
  attr_accessible :email, :password, :username
end
