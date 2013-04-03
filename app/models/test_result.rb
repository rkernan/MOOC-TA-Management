class TestResult < ActiveRecord::Base
  belongs_to :teaching_assistant
  belongs_to :ta_test
  attr_accessible :correctness, :selected
end
