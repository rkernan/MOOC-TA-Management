class QuestionResult < ActiveRecord::Base
  belongs_to :test_result
  attr_accessible :correct
  has_many :answer_results
end
