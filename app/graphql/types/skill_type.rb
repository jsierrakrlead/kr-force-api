module Types
  class SkillType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :users, [UserType], null: true
    field :user_skill_levels, [UserSkillLevelType], null: true
  end
end
