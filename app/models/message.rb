class Message < ActiveRecord::Base
  belongs_to :subbludit
  belongs_to :user

  has_many :comments

  validates_presence_of :title, :content
  validates_uniqueness_of :title, scope: :subbludit
end
