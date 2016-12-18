class CreateProjectGroups < ActiveRecord::Migration
  def change
    create_table :project_groups do |t|
      t.belongs_to :project, index: true
      t.belongs_to :group, index: true
      t.timestamps null: false
    end
  end
end
