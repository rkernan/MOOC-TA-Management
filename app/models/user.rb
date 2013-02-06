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

  # check if passwords match
  def password_matches?(other_password)
    self.password_hash == _hash_password(other_password)
  end

  # authenticates user based on given email and password
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user.password_matches?(password)
      user
    else
      nil
    end
  end

  private
  
  # generates a salt and hashes the password
  def hash_password
    if password.present?
      self.password_salt = _generate_salt
      self.password_hash = _hash_password
    end
  end

  # helper for generating a salt
  def _generate_salt
    BCrypt::Engine.generate_salt
  end

  # helper for hashing the password
  def _hash_password
    BCrypt::Engine.hash_secret(password, password_salt)
  end
end
