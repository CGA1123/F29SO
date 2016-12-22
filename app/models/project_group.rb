class ProjectGroup < ActiveRecord::Base
  has_many :project_group_permissions
  has_many :permissions, through: :project_group_permissions

  has_many :user_project_groups
  has_many :users, through: :user_project_groups

  belongs_to :project

  validates :name, uniqueness: { case_sensitive: false }
  validates :project, :name, presence: true
end
