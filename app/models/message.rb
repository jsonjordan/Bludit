class Message < ActiveRecord::Base
  belongs_to :subbludit
  belongs_to :user

  validates_presence_of :title, :content
  validates_uniqueness_of :title, scope: :subbludit
end
