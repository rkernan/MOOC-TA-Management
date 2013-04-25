class QuestionResult < ActiveRecord::Base
  belongs_to :test_result
  belongs_to :question
  has_many :answer_results, :dependent => :destroy
  attr_accessible :correct, :answer_results_attributes, :question, :test_result
  accepts_nested_attributes_for :answer_results
  validates :test_result, :presence => true
  validates :question, :presence => true
end
