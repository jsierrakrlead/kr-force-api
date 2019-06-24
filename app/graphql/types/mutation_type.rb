module Types
  class MutationType < Types::BaseObject

    field :create_user_skill_levels, mutation: Mutations::CreateUserSkillLevels

  end
end
