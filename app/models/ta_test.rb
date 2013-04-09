class TaTest < ActiveRecord::Base
  belongs_to :course
  has_many :questions, :dependent => :destroy
  has_many :test_results
  attr_accessible :name, :questions_attributes
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
