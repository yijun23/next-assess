Rails.application.routes.draw do

  resources :games
  root 'welcome#index'  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'logout', to: 'sessions#destroy', as: 'logout'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"



end