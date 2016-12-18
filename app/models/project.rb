class Project < ActiveRecord::Base
  validates :project_name, presence: true
  validates :project_code, presence: true
  has_many :project_groups
  has_many :groups, through: :project_groups
  validates :project_code, uniqueness: { case_sensitive: false }
end
