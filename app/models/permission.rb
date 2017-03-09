class Permission < ActiveRecord::Base
  has_many :group_permissions
  has_many :groups, through: :group_permissions

  has_many :project_role_permissions
  has_many :project_roles, through: :project_role_permissions

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
