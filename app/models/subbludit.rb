class Subbludit < ActiveRecord::Base
  has_many :messages
  has_many :moderators
  has_many :users, through: :moderators

  validates_presence_of :name
  validates_uniqueness_of :name
end
