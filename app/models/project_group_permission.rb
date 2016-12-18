class ProjectGroupPermission < ActiveRecord::Base
  belongs_to :project_group
  belongs_to :project_permission
  validates :project_permission_id, uniqueness: { scope: :project_group_id }
end
