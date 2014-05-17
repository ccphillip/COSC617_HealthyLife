class Goal < ActiveRecord::Base
  include SocialStream::Models::Object
  attr_accessible :date, :description, :name, :priority, :status, :author_id, :owner_id, :user_author_id
  has_many :progresses
end
