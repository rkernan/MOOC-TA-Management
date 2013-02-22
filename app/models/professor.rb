class Professor < User
  # has many courses they are Teaching
  has_many :courses

  # TODO FIX, remove
  def self.model_name
    User.model_name
  end

  # TODO FIX, remove
  def to_partial_path
    User.to_partial_path
  end
end
