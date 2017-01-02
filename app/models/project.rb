class Project < ActiveRecord::Base
  has_many :project_groups
  has_many :users, through: :project_groups
  validates :name, :code, presence: true
  validates :code, uniqueness: { case_sensitive: false }
end
