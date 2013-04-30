class TestResult < ActiveRecord::Base
  belongs_to :teaching_assistant
  belongs_to :ta_test
  has_many :question_results, :dependent => :destroy
  attr_accessible :question_results_attributes, :teaching_assistant, :ta_test, :grade
  accepts_nested_attributes_for :question_results
  validates :teaching_assistant, :presence => true
  validates :ta_test, :presence => true

  before_save :grade_test

  def grade_test
    correct_count = 0
    question_count = 0
    self.question_results.each do |question_result|
      question_count += 1
      if question_result.correct?
        correct_count += 1
      end
    end
    self.grade = (correct_count.to_f / question_count.to_f) * 100.0
  end
end
