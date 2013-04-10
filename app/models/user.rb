class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.email_field = :email
    c.login_field = :email
    c.crypted_password_field = :password_hash
    c.password_salt_field = :password_salt
  end
  attr_accessible :email, :password, :password_confirmation, :type
end

