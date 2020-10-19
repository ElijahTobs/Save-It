Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  get '/savings/new/:group', to: 'savings#new'

  post '/access', to: 'access_control#signin'
  delete '/access', to: 'access_control#logout'

  get '/mysavings', to: 'savings#index'
  # get '/groups', to: 'groups#index'

  

  resources :savings
  resources :users
end
