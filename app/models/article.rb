class Article < ActiveRecord::Base
  include SocialStream::Models::Object
  attr_accessible :article_type, :body, :subject,:activity_object_id,:author_id, :user_author_id, :owner_id,:user_id
end
