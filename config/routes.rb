Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  post '/access', to: 'access_control#signin'
  delete '/access', to: 'access_control#logout'

  get '/mysavings', to: 'savings#index'
  

  resources :savings
  resources :users
end
