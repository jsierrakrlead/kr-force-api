class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :name, null: false
      t.integer :weight, null: false
      t.text :description
    end
    add_index :levels, :weight, unique: true
    add_index :levels, :name, unique: true
  end
end
