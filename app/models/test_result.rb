class TestResult < ActiveRecord::Base
  belongs_to :teaching_assistant
  belongs_to :ta_test
  has_many :question_results
end
