class AddSkillTypeForeignKey < ActiveRecord::Migration
  def change
    change_table :skills do |t|
      t.belongs_to :skill_type, index: true
    end
  end
end
