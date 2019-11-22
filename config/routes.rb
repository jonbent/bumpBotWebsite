Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  get 'auth', to: 'sessions#new'
  get 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  get 'create_guild', to: 'guilds#create'

  resources :users
  resources :guilds, only: [:show]
end
