class CreateSkillTypes < ActiveRecord::Migration
  def change
    create_table :skill_types do |t|
      t.string :name
      t.string :description
      t.timestamps null: false
    end

    add_column :skills, :skill_type_id, :integer, index: true
  end
end
