class CreateInvitationGroups < ActiveRecord::Migration
  def change
    create_table :invitation_groups do |t|
      t.belongs_to :invitation, index: true
      t.belongs_to :group, index: true
      t.timestamps null: false
    end
  end
end
