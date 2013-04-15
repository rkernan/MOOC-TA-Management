class ParseResult < ActiveRecord::Base
  attr_accessible :activity, :fog, :pending, :professor_id, :ta_id
end
