class CreateProjectRoleSkills < ActiveRecord::Migration
  def change
    drop_table :project_skills

    create_table :project_role_skills do |t|
      t.belongs_to :project_role, index: true
      t.belongs_to :skill, index: true
      t.integer :rating
      t.timestamps null: false
    end

    add_foreign_key :project_role_skills, :project_roles
    add_foreign_key :project_role_skills, :skills
  end
end
