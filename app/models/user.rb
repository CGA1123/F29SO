class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :timeoutable
  has_many :user_groups
  has_many :groups, through: :user_groups

  validates :groups, presence: true
end
