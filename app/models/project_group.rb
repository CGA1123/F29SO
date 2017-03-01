class ProjectGroup < ActiveRecord::Base
  has_many :project_group_permissions
  has_many :permissions, through: :project_group_permissions

  has_many :project_group_users
  has_many :users, through: :project_group_users

  belongs_to :project

  validates :name, uniqueness: { case_sensitive: false }
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
