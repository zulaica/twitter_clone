class Post < ActiveRecord::Base
  belongs_to :user

  validates :body, :presence => true

  default_scope { order('published DESC') }
end
