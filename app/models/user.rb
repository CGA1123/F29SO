class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :timeoutable, :invitable
  has_many :user_groups
  has_many :groups, through: :user_groups

  validates :groups, presence: true

  def permission?(permission_name)
    permission_strings.include?(permission_name)
  end

  def permission_strings
    groups.map(&:permission_strings).flatten.uniq
  end
end
