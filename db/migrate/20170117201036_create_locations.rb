class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.timestamps null: false
    end

    change_table :users do |t|
      t.remove :location
      t.belongs_to :location, index: true
    end
  end
end
