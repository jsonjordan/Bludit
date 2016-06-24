class Subbludit < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  has_many :comments, through: :messages
  has_many :moderators, dependent: :destroy
  has_many :users, through: :moderators

  validates_presence_of :name
  validates_uniqueness_of :name
end
