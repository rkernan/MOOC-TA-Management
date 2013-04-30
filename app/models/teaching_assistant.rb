class TeachingAssistant < User
  has_many :courses
  has_many :test_results
  has_many :ta_tests, :through => :test_results

  def to_partial_path
    User.to_partial_path
  end
end
