class Questions < ActiveRecord::Base
  belongs_to :ta_test
  has_many :answers
  attr_accessible :content
end
