class ProjectRoleLocation < ActiveRecord::Base
  belongs_to :project_role
  belongs_to :location

  validates :project_role_id, uniqueness: { scope: :location_id }
  validates :project_role, :location, presence: true
end
