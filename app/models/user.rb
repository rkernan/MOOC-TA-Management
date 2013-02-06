class User < ActiveRecord::Base
  attr_accessible :email, :password_hash, :password_salt, :password, :password_confirmation
  attr_accessor :password

  before_save :hash_password

  # email validation
  validates :email, :presence => true,
    :uniqueness => { :case_sensitive => true },
    :format => { :with => /.+@.+\..+/ }
  # plain-text password (not stored)
  validates :password, :confirmation => true,
    :length => 6..20

  private
  
  def hash_password
    if password.present?
      self.password_salt = _generate_salt
      self.password_hash = _hash_password
    end
  end

  def _generate_salt
    BCrypt::Engine.generate_salt
  end

  def _hash_password
    BCrypt::Engine.hash_secret(password, password_salt)
  end
end
