class AddProjectTypeForeignKey < ActiveRecord::Migration
  def change
    add_column :projects, :project_type_id, :integer, index: true
  end
end
