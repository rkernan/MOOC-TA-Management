class Course < ActiveRecord::Base
  belongs_to :professor
  has_many :teaching_assistants
  attr_accessible :name
end
