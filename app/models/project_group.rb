class ProjectGroup < ActiveRecord::Base
  has_many :project_group_permissions
  has_many :permissions, through: :project_group_permissions

  has_many :project_group_users
  has_many :users, through: :project_group_users

  belongs_to :project

  validates :name, uniqueness: { case_sensitive: false }
  validates :project, :name, presence: true

  def permission_strings
    permissions.map {|permission| "#{id}.#{permission.name}" }
  end
end
