class CreateProjectRoleLocations < ActiveRecord::Migration
  def change
    create_table :project_role_locations do |t|
      t.belongs_to :project_role
      t.belongs_to :location
      t.timestamps null: false
    end

    add_foreign_key :project_role_locations, :project_roles
    add_foreign_key :project_role_locations, :locations
  end
end
