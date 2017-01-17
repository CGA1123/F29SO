class AddSkillTypeForeignKey < ActiveRecord::Migration
  def change
    add_column :skills, :skill_type_id, :integer, index: true
  end
end
