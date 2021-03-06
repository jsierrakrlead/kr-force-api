class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.text :description
    end
    add_index :skills, :name, unique: true
  end
end
