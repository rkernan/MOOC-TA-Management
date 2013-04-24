class TaTestRequest < ActiveRecord::Base
  belongs_to :course
  attr_accessible :ta_email


end
