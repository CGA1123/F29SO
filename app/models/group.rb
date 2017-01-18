class Group < ActiveRecord::Base
  has_many :group_permissions
  has_many :permissions, through: :group_permissions

  has_many :group_users
  has_many :users, through: :group_users

  has_many :invitation_groups
  has_many :invitations, through: :invitation_groups

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  before_destroy :check_if_root

  def permission_strings
    permissions.map(&:name)
  end

  private

  def check_if_root
    name != 'root'
  end
end
