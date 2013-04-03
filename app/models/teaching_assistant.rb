class TeachingAssistant < User
  # has many courses they are a TA for
  has_many :courses

  # def self.model_name
  #   User.model_name
  # end

  # TODO FIX, remove
  def to_partial_path
    User.to_partial_path
  end
end
