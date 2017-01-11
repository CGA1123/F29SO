class Project < ActiveRecord::Base
  has_many :project_groups
  has_many :users, through: :project_groups
  belongs_to :project_type

  validates :name, :code, :project_type, presence: true
  validates :code, uniqueness: { case_sensitive: false }
end
