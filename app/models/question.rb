class Question < ActiveRecord::Base
  belongs_to :ta_test
  attr_accessible :answer, :question, :type
end
