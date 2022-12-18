Rails.application.routes.draw do
  root 'calc#input', as: 'home'
  get 'calc/input'
  get 'calc/output'
  get 'users/new'
  get 'users/show'
  get 'users/update'
  post 'users/create', to: 'users#create'
  post 'users/destroy', to: 'users#destroy'
  get 'sessions/new'
  post 'sessions/create', to: 'sessions#create'
  post 'sessions/destroy', to: 'sessions#destroy'
  resources :sessions
  resources :users
end
