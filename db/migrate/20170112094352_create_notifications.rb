class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.integer :actor_id
      t.datetime :read_at
      t.string :action
      t.string :notifiable_type
      t.integer :notifiable_id

      t.timestamps null: false
    end

    add_foreign_key :notifications, :users, column: :actor_id
    add_foreign_key :notifications, :users, column: :recipient_id
  end
end
