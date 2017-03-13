Rails.application.routes.draw do

  root to: 'users#index'

  get 'users/new', to: 'users#new', as: 'new_user'
  get 'users/:id', to: 'users#show', as: 'user'
  post '/users', to: 'users#create'

  get '/libraries', to: 'libraries#index'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'


end
