Inputs::UserSkillLevelAttributes = GraphQL::InputObjectType.define do
  name("UserSkillLevelAttributes")
  input_field :id, types.String
  input_field :email, types.String
  input_field :skill_level, Inputs::SkillLevelAttributes
end
