class IndexInviterId < ActiveRecord::Migration
  def change
    add_index :invitations, :inviter_id
  end
end
