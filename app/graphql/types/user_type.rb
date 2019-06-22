module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :avatar_url, String, null: false
    field :skills, [SkillType], null: true
    field :user_skill_levels, [UserSkillLevelType], null: true
  end


end
