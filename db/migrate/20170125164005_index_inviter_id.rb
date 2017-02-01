class IndexInviterId < ActiveRecord::Migration
  def change
    add_index :invitations, :inviter_id
    add_index :projects, :project_type_id
  end
end
