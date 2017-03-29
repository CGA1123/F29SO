class CreateSystemAnnouncements < ActiveRecord::Migration
  def change
    create_table :system_announcements do |t|
      t.string :title
      t.string :content
      t.timestamps null: false
    end
  end
end
