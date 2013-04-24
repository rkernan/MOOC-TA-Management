class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :answer_results
  attr_accessible :content, :correct
  validates :content, :presence => true
end
