class Question < ActiveRecord::Base
  belongs_to :ta_test
  has_many :answers, :dependent => :destroy
  attr_accessible :content, :answers_attributes
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  # validate :validate_correct_answer, :message => "A question must have at least one correct answer."
  validates :content, :presence => true
  validate :validate_correct_answer

  private

  def validate_correct_answer
    has_correct = false
    answers.each do |answer|
      if answer.correct
        has_correct = true
      end
    end
    if not has_correct
      errors.add(:answers, "Each question must have at least one correct answer.")
    end
  end
end
