class CreateProjectGroupUsers < ActiveRecord::Migration
  def change
    create_table :project_group_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project_group, index: true
      t.timestamps null: false
    end
  end
end
