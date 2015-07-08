Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :lists do
    resources :list_movies
  end
  root 'movies#index'
  get '/movies/:id', to: 'movies#show', as: 'movie'
  get "search/index"
  match '/search', to: 'search#index',          via: 'get'
  match '/signup', to: 'users#new',             via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
