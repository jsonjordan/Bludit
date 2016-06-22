class Message < ActiveRecord::Base
  belongs_to :subbludit
  belongs_to :user
end
