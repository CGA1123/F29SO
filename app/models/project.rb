class Project < ActiveRecord::Base
  belongs_to :project_type

  has_many :project_groups, dependent: :delete_all
  has_many :users, through: :project_groups

  has_many :project_skills, dependent: :destroy
  has_many :skills, through: :project_skills

  has_many :project_locations, dependent: :destroy
  has_many :locations, through: :project_locations

  validates :name, :code, :project_type, presence: true
  validates :code, uniqueness: { case_sensitive: false }
end
