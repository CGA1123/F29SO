class Permission < ActiveRecord::Base
  has_many :group_permissions
  has_many :groups, through: :group_permissions

  has_many :project_group_permissions
  has_many :project_groups, through: :project_group_permissions

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
