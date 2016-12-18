class CreateProjectPermissions < ActiveRecord::Migration
  def change
    create_table :project_permissions do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
