Rails.application.routes.draw do
  resources :users, only: %i[new create show]
  resources :events, except: %i[edit destroy]
end
