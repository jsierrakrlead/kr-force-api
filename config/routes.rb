Rails.application.routes.draw do
  post "/api/kr-force/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
