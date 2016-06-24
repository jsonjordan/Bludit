class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  acts_as_votable

  validates_presence_of :content
end
