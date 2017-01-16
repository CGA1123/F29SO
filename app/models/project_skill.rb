class ProjectSkill < ActiveRecord::Base
  belongs_to :project
  belongs_to :skill

  enum qualifier: { required: 0, recommended: 1 }

  validates :skill_id, uniqueness: { scope: :project_id }
  validates :project, :skill, :qualifier, presence: true
end
