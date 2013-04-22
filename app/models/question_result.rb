class QuestionResult < ActiveRecord::Base
  belongs_to :test_result
  belongs_to :question
  attr_accessible :correct, :answer_results_attributes, :question, :test_result
  has_many :answer_results
  accepts_nested_attributes_for :answer_results
end
