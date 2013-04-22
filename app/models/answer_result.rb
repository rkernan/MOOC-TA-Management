class AnswerResult < ActiveRecord::Base
  belongs_to :question_result
  belongs_to :answer
  attr_accessible :selected, :answer, :question_result
end
