class CreateGroupPermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :permission_string
      t.string :description
      t.timestamps null: false
    end

    create_table :groups do |t|
      t.string :group_name
      t.string :description
      t.timestamps null: false
    end

    create_table :group_permissions do |t|
      t.belongs_to :group, index: true
      t.belongs_to :permission, index: true
      t.timestamps null: false
    end
  end
end
