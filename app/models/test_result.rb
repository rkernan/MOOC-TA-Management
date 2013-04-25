class TestResult < ActiveRecord::Base
  belongs_to :teaching_assistant
  belongs_to :ta_test
  has_many :question_results, :dependent => :destroy
  attr_accessible :question_results_attributes, :teaching_assistant, :ta_test
  accepts_nested_attributes_for :question_results
  validates :teaching_assistant, :presence => true
  validates :ta_test, :presence => true
end
