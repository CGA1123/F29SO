class SimplifyColumnNames < ActiveRecord::Migration
  def change
    rename_column :groups, :group_name, :name
    rename_column :permissions, :permission_string, :name
  end
end
