class ProjectPermission < ActiveRecord::Base
  has_many :project_group_permissions
  has_many :project_groups, through :project_group_permissions
end
