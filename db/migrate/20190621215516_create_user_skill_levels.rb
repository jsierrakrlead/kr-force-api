class CreateUserSkillLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :user_skill_levels do |t|
      t.references :skill_level, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true
    end
    add_index :user_skill_levels, [:user_id, :skill_level_id], name: "user_on_skill_level", unique: true
  end
end
