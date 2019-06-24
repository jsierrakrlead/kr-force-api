Inputs::SkillLevelAttributes = GraphQL::InputObjectType.define do
  name("SkillLevelAttributes")
  input_field :skill_id, !types.String
  input_field :level_id, !types.String
end
