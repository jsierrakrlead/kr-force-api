module Mutations
  class CreatetUserSkillLevels < BaseMutation
    argument :users, [Inputs::UserAttributes], required: true
    argument :skill_levels, [Inputs::SkillLevelAttributes], required: true

    field :user_skill_level, Types::UserSkillLevelType, null: true
    field :errors, [Types::UserError], null: true

    def resolve(users:, skill_levels:)
      
    end
  end
end
