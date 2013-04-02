class Question < ActiveRecord::Base
  belongs_to :ta_test
  attr_accessible :answer, :question, :question_type, :wrong1, :wrong2, :wrong3
end
