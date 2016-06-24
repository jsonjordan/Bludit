class Message < ActiveRecord::Base
  belongs_to :subbludit
  belongs_to :user

  acts_as_votable

  has_many :comments, dependent: :destroy

  validates_presence_of :title, :content
  validates_uniqueness_of :title, scope: :subbludit
end
