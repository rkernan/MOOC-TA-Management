class Professor < User
  has_many :courses

  def to_partial_path
    User.to_partial_path
  end
end
