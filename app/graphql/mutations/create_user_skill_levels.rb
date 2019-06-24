module Mutations
  class CreateUserSkillLevels < BaseMutation

    argument :user_skills, [Inputs::UserSkillLevelAttributes], required: true

    field :user_skill_level, Types::UserSkillLevelType, null: true
    field :errors, [Types::UserError], null: true

    def resolve(users:, skill_levels:)
      puts "the sklslkflkssdf", users.inspect, skill_levels.inspect
    end
  end
end
