class Skill < ActiveRecord::Base
  has_many :user_skills
  has_many :users, through: :user_skills
  belongs_to :skill_type
  has_many :project_skills
  has_many :projects, through: :project_skills

  validates :name, :description, :skill_type, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
