class CreateProjectGroupPermissions < ActiveRecord::Migration
  def change
    create_table :project_group_permissions do |t|
      t.belongs_to :project_group, index: true
      t.belongs_to :permission, index: true
      t.timestamps null: false
    end
  end
end
