class TaTest < ActiveRecord::Base

  # This tells Rails that the 'Question' table [should] contain
  # a reference to a TaTest. This let's us call ta_test_object.questions
  # to get a list of all the questions belonging to this test. It's
  # important to note that the actual 'TaTest' table DOES NOT contain
  # any references to Questions. When you call .questions(), Rails
  # knows to do a query on the 'Question' table for records with a 
  # 'ta_test_id that' matches the calling objects id.
  has_many :questions
  has_many :test_results
  attr_accessible :name
  belongs_to :course
end
