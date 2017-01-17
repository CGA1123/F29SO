class Skill < ActiveRecord::Base
  has_many :user_skills
  has_many :users, through: :user_skills
  has_many :project_skills
  has_many :projects, through: :project_skills

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
