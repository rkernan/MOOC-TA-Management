class Course < ActiveRecord::Base
  belongs_to :professor
  has_many :teaching_assistants
  has_many :ta_tests
  has_many :ta_test_requests
  attr_accessible :name

  validates :name, :presence => true

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
