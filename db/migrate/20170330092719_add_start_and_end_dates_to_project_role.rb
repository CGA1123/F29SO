class AddStartAndEndDatesToProjectRole < ActiveRecord::Migration
  def change
    add_column :project_roles, :start_date, :date
    add_column :project_roles, :end_date, :date
  end
end
