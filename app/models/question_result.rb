class QuestionResult < ActiveRecord::Base
  belongs_to :test_result
  belongs_to :question
  has_many :answer_results, :dependent => :destroy
  attr_accessible :answer_results_attributes, :question, :test_result
  accepts_nested_attributes_for :answer_results
  # validates :test_result, :presence => true
  validates :question, :presence => true

  def correct?
    self.answer_results.each do |answer_result|
      if not answer_result.correct?
        return false
      end
    end
    return true
  end
end
