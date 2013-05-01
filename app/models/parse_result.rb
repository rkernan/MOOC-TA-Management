class ParseResult < ActiveRecord::Base
  attr_accessible :name, :user_id, :activity, :fog, :kincaid, :flesch, :course_path, :ta_id
end
