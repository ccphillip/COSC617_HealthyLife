class Progress < ActiveRecord::Base
  attr_accessible :created, :description, :number
  belongs_to :goal
end
