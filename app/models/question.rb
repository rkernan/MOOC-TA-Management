class Question < ActiveRecord::Base
  belongs_to :ta_test
  attr_accessible :answer, :question, :question_type
end
