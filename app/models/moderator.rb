class Moderator < ActiveRecord::Base
  belongs_to :user
  belongs_to :subbludit


end
