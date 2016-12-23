class ProjectGroupPermission < ActiveRecord::Base
  belongs_to :project_group
  belongs_to :permission

  validates :permission_id, uniqueness: { scope: :project_group_id }
  validates :project_group, :permission, presence: true
end
