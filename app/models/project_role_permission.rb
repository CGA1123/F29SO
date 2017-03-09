class ProjectRolePermission < ActiveRecord::Base
  belongs_to :project_role
  belongs_to :permission

  validates :project_role_id, uniqueness: { scope: :permission_id }
  validates :project_role, :permission, presence: true
end
