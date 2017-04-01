class AddIndicesToUsersAndProjects < ActiveRecord::Migration
  def change
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :projects, :name
    add_index :projects, :code
    add_index :project_roles, :name
    add_index :permissions, :name
  end
end
