class ProjectGroupPermission < ActiveRecord::Base
  belongs_to :project_group
  belongs_to :permission

  validates :project_group_id, uniqueness: { scope: :permission_id }
  validates :project_group, :permission, presence: true
end
