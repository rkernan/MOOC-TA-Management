class Course < ActiveRecord::Base
  belongs_to :professor
  has_many :teaching_assistants
  has_many :ta_tests
  attr_accessible :name
end
