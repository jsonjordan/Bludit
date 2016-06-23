class Subbludit < ActiveRecord::Base
  has_many :messages

  validates_presence_of :name
  validates_uniqueness_of :name
end
