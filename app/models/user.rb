class User < ActiveRecord::Base

  # attr_accessible sets ups getters and setters for each variable.
  # it IS possible to check for valid assignment to these fields 
  # we'll get into that later.
  attr_accessible :email, :password_hash, :password, :password_confirmation
  attr_accessor :password

  before_save :hash_password

  validates :email, :presence => true,
    :uniqueness => { :case_sensitive => true },
    :format => { :with => /.+@.+\..+/ }
  # confirm password
  # NOTE: password not stored in database
  validates :password, :confirmation => true,
    :length => 6..20

  def hash_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
