class Project < ActiveRecord::Base
  has_many :project_groups
  has_many :users, through: :project_groups
  belongs_to :project_type
  has_many :project_skills
  has_many :skills, through: :project_skills

  validates :name, :code, :project_type, presence: true
  validates :code, uniqueness: { case_sensitive: false }
end
