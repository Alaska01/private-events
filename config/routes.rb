Rails.application.routes.draw do
  root 'events#index'
  resources :users, only: %i[new create show]
  resources :events, except: %i[edit destroy]
  resources :sessions, only: %i[new create destroy]
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
 
end
