class Goal < ActiveRecord::Base
  include SocialStream::Models::Object
  attr_accessible :date, :description, :name, :priority, :status, :activity_object
end
