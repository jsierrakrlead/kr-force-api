module Mutations
  class CreateUserSkillLevels < BaseMutation

    argument :user_skills, [Inputs::UserSkillLevelAttributes], required: true

    field :user_skill_levels, [Types::UserSkillLevelType], null: true
    field :errors, [Types::UserError], null: true

    def resolve(user_skills:)
      user_ids = user_skills.map{|arg| {id: arg.id , level_id: arg.skill_level[:level_id], skill_id: arg.skill_level[:skill_id]}}

      usr_skill_levels = user_skills.map do |arg|
        UserSkillLevel.find_or_create_by!({
          user: User.find_by(id: arg.id),
          skill_level: SkillLevel.find_or_create_by!({
              level_id: arg.skill_level[:level_id],
              skill_id: arg.skill_level[:skill_id]
            })
        })
      end
      {
        user_skill_levels: usr_skill_levels
      }
    end
  end
end
