class Group < ActiveRecord::Base
  has_many :group_permissions
  has_many :permissions, through: :group_permissions
  has_many :user_groups
  has_many :users, through: :user_groups

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def permission_strings
    permissions.map(&:name)
  end
end