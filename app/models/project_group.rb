class ProjectGroup < ActiveRecord::Base
  has_many :project_group_permissions
  has_many :project_permissions, through: :project_group_permissions
  belongs_to :group
  belongs_to :project
  validates :group_id, uniqueness: { scope: :project_id }
end
