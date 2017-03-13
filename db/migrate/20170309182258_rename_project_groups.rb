class RenameProjectGroups < ActiveRecord::Migration
  def change
    rename_table :project_groups, :project_roles
    rename_table :project_group_users, :project_role_users
    rename_table :project_group_permissions, :project_role_permissions

    rename_column :project_role_permissions, :project_group_id, :project_role_id
    rename_column :project_role_users, :project_group_id, :project_role_id
  end
end
