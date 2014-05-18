class Goal < ActiveRecord::Base
  include SocialStream::Models::Object
  attr_accessible :date, :description, :name, :priority, :status, :activity_object_id,:author_id, :user_author_id, :owner_id
  has_many :progresses
end
