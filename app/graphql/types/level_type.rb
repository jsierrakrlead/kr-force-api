module Types
  class LevelType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :weight, Int, null: false
    field :description, String, null: true
  end
end
