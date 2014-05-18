class Progress < ActiveRecord::Base
  attr_accessible :created, :description, :number, :goal_id
  belongs_to :goal
end
