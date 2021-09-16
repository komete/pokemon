Rails.application.routes.draw do
  get "/pokemons", to: "pokemons#index"
  get "/pokemons/:id", to: "pokemons#show"
  put "/pokemons/:id", to: "pokemons#update"
  post "/pokemons", to: "pokemons#create"
  delete "/pokemons/:id", to: "pokemons#destroy"
end
