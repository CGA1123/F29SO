class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :sent_at
      t.string :accepted_at
      t.string :token
      t.timestamps null: false
    end
  end
end
