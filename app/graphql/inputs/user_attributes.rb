Inputs::UserAttributes = GraphQL::InputObjectType.define do
  name("UserAttributes")
  input_field :id, types.String
  input_field :name, types.String
  input_field :email, types.String
end
