class ProjectRoleUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :project_role

  validates :project_role_id, uniqueness: { scope: :user_id }
  validates :user, :project_role, presence: true
end
