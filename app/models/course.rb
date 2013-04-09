class Course < ActiveRecord::Base
  belongs_to :professor
  has_many :teaching_assistants
  has_many :ta_tests
  attr_accessible :name

def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end


end
