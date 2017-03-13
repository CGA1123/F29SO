class ProjectRole < ActiveRecord::Base
  belongs_to :project

  has_many :project_role_permissions
  has_many :permissions, through: :project_role_permissions

  has_many :project_role_users
  has_many :users, through: :project_role_users

  has_many :project_role_locations, dependent: :destroy
  has_many :locations, through: :project_role_locations

  has_many :project_role_skills
  has_many :skills, through: :project_role_skills

  validates :name, uniqueness: { case_sensitive: false, scope: :project_id }
  validates :project, :name, presence: true

  before_destroy :check_if_owner

  def permission_strings
    permissions.map { |permission| "#{project_id}.#{permission.name}" }
  end

  private

  def check_if_owner
    name != 'Owner'
  end
end
