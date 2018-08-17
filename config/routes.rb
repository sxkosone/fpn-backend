Rails.application.routes.draw do
  # get '/users/search', to: 'users#search' (this is now in search controller)
  resources :users, only: [:create, :update, :destroy, :show]
  resources :search, only: [:index]
  get '/search/categories', to: 'search#categories'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
