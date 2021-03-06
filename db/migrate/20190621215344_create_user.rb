class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.boolean :admin, null: false, default: false
      t.string :avatar_url
    end
    add_index :users, :email, unique: true
  end
end
