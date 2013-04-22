class TestResult < ActiveRecord::Base
  belongs_to :teaching_assistant
  belongs_to :ta_test
  has_many :question_results
  has_many :answer_results, :through => :question_results
  attr_accessible :question_results_attributes, :answer_results_attributes
  accepts_nested_attributes_for :question_results
  accepts_nested_attributes_for :answer_results
end
