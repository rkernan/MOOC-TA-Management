class TaTest < ActiveRecord::Base

    has_many :questions

    belongs_to :course
    attr_accessible :name
end
