class ProjectPermission < ActiveRecord::Base
  has_many :project_group_permissions
  has_many :project_groups, through: :project_group_permissions
  validates :name, presence: true
  validates :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
