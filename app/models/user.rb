class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :comments
  has_many :votes
  has_many :moderators
  has_many :subbludits, through: :moderators

  validates_presence_of :name
  validates_uniqueness_of :name

  def admin?
    self.permission == "admin"
  end
end
