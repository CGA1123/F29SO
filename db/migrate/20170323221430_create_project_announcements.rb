class CreateProjectAnnouncements < ActiveRecord::Migration
  def change
    create_table :project_announcements do |t|
      t.string :title
      t.string :content
      t.belongs_to :project, index: true
      t.timestamps null: false
    end

    add_foreign_key :project_announcements, :projects
  end
end
