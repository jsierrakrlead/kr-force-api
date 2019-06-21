class CreateSkillLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_levels do |t|
      t.references :skill, null: false, index: true, foreign_key: true
      t.references :level, null: false, index: true, foreign_key: true
    end
    add_index :skill_levels, [:skill_id, :level_id], name: 'skill_on_level', unique: true
  end
end
