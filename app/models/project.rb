class Project < ActiveRecord::Base
  belongs_to :project_type

  has_many :project_roles, dependent: :delete_all
  has_many :users, through: :project_roles

  has_many :project_skills, dependent: :destroy
  has_many :skills, through: :project_skills

  validates :name, :code, :project_type, presence: true
  validates :code, uniqueness: { case_sensitive: false }
end
