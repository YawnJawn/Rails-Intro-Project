Rails.application.routes.draw do
  get 'about', to:"about#index"
  get 'search', to:"search#index"
  get 'advanced_search', to:"advanced_search#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "pokemons#index"
  #pokemon will automatically load the index view
  get "/pokemons", to: "pokemons#index"
  
  # Defines the root path route ("/")
  # root "posts#index"
  resources :pokemons do
    collection do
      get 'show_all'
    end
  end
end
