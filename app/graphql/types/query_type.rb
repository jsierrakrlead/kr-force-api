module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :levels, [LevelType], null: false do
      argument :ids, [ID], required: false
      argument :names, [String], required: false
      argument :weights, [Int], required: false
    end

    def levels(names: [], ids: [], weights: [])
      (names.present? || ids.present?) ? Level.where(names: names).or(Level.where(id: ids)).or(Level.where(weights: weights)) : Level.all
    end

    field :skills, [SkillType], null: false do
      argument :ids, [ID], required: false
      argument :names, [String], required: false
    end

    def skills(names: [], ids: [])
      (names.present? || ids.present?) ? Skill.where(names: names).or(Skill.where(id: ids)) : Skill.all
    end

    field :users, [UserType], null: false do
      argument :emails, [String], required: false
      argument :ids, [ID], required: false
    end


    def users(emails: [], ids: [])
      (emails.present? || ids.present?) ? User.where(email: emails).or(User.where(id: ids)) : User.all
    end

  end
end
