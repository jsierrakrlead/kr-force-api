module Types
  class UserSkillLevelType < BaseObject
    field :id, ID, null: false
    field :user, UserType, null: false
    field :skill, SkillType, null: false
    field :level, LevelType, null: false


  end
end
