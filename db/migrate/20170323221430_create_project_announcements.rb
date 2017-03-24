class CreateProjectAnnouncements < ActiveRecord::Migration
  def change
    create_table :project_announcements do |t|
      t.belongs_to :project, index: true
      t.belongs_to :announcement, index: true
      t.timestamps null: false
    end

    add_foreign_key :project_announcements, :projects
    add_foreign_key :project_announcements, :announcements
  end
end
