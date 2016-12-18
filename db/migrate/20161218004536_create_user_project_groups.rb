class CreateUserProjectGroups < ActiveRecord::Migration
  def change
    create_table :user_project_groups do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project_group, index: true
      t.timestamps null: false
    end
  end
end
