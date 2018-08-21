Rails.application.routes.draw do
 
  post '/users/login', to: 'users#login'
  get '/users/current-user', to: 'users#show'
  post '/users/current-user', to: 'users#update'

  resources :users, only: [:create, :update, :show]
  resources :search, only: [:index]
  get '/search/categories', to: 'search#categories'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
