class CreateProjectLocations < ActiveRecord::Migration
  def change
    create_table :project_locations do |t|
      t.belongs_to :project
      t.belongs_to :location
      t.timestamps null: false
    end


    add_foreign_key :project_locations, :projects
    add_foreign_key :project_locations, :locations
  end
end
