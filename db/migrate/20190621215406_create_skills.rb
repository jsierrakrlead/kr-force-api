class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :category, null: false, default: 0
      t.text :description
    end
    add_index :skills, [:name, :category], name: 'name_on_category', unique: true
  end
end
