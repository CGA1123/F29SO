class AddUserIdToAnnouncements < ActiveRecord::Migration
  def change
    add_reference :system_announcements, :user, index: true, foreign_key: true
    add_reference :project_announcements, :user, index: true, foreign_key: true
  end
end
