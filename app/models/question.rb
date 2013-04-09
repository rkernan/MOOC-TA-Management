class Question < ActiveRecord::Base
  belongs_to :ta_test
  has_many :answers, :dependent => :destroy
  attr_accessible :content, :answers_attributes
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
