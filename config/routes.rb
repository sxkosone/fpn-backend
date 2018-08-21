Rails.application.routes.draw do
 
  post '/users/login', to: 'users#login'
  get '/users/current-user', to: 'users#show'
  patch '/users/current-user', to: 'users#update'
  get '/search/categories', to: 'search#categories'
  resources :users, only: [:create]
  resources :search, only: [:index]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
