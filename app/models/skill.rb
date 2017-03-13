class Skill < ActiveRecord::Base
  belongs_to :skill_type

  has_many :user_skills
  has_many :users, through: :user_skills

  has_many :project_role_skills
  has_many :project_roles, through: :project_role_skills

  validates :name, :description, :skill_type, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
