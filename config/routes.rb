Rails.application.routes.draw do
  resources :groups, except: [:update, :edit]
  resources :savings, except: [:update, :edit]
  resources :users, except: [:update, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Custom endpoints for the app
  get '/savings/new/:group', to: 'savings#new'

  post '/access', to: 'access_control#signin'
  get '/access', to: 'access_control#logout'

  get '/mysavings', to: 'savings#index'
  get '/myexternal', to: 'savings#my_external'

  # Custom root page for the application
  root 'application#index'
end