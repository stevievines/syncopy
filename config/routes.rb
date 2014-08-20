Rails.application.routes.draw do
  root 'movies#index'
  get '/movies/:id', to: 'movies#show', as: 'movie'
  get "search/index"
  match '/search', to: 'search#index', via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  resources :users
end
