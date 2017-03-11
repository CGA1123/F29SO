class ProjectRoleSkill < ActiveRecord::Base
  belongs_to :project_role
  belongs_to :skill

  enum rating: { basic: 0, novice: 1, intermediate: 2, advanced: 3, expert: 4 }

  validates :project_role_id, uniqueness: { scope: :skill_id }
  validates :project_role, :skill, :rating, presence: true
end
