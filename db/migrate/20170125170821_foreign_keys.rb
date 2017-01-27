class ForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :invitations, :users, column: :inviter_id
    add_foreign_key :users, :locations
    add_foreign_key :user_skills, :users
    add_foreign_key :user_skills, :skills
    add_foreign_key :skills, :skill_types
    add_foreign_key :projects, :project_types
    add_foreign_key :project_skills, :projects
    add_foreign_key :project_skills, :skills
    add_foreign_key :project_groups, :projects
    add_foreign_key :project_group_users, :users
    add_foreign_key :project_group_users, :project_groups
    add_foreign_key :project_group_permissions, :project_groups
    add_foreign_key :project_group_permissions, :permissions
    add_foreign_key :invitation_groups, :groups
    add_foreign_key :invitation_groups, :invitations
    add_foreign_key :group_users, :groups
    add_foreign_key :group_users, :users
    add_foreign_key :group_permissions, :groups
    add_foreign_key :group_permissions, :permissions
  end
end
