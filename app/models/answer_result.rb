class AnswerResult < ActiveRecord::Base
  belongs_to :question_result
  attr_accessible :correct, :selected
end
