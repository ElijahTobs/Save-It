Rails.application.routes.draw do
  resources :groups, except: [:update, :edit]
  resources :savings, except: [:update, :edit]
  resources :users, except: [:update, :edit]
  
  get '/savings/new/:group', to: 'savings#new'

  post '/access', to: 'access_control#signin'
  get '/access', to: 'access_control#logout'

  get '/mysavings', to: 'savings#index'
  get '/myexternal', to: 'savings#my_external'

  root 'application#index'
end