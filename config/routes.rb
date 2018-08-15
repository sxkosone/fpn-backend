Rails.application.routes.draw do
  get '/users/search', to: 'users#search'
  resources :users, only: [:create, :update, :destroy, :show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
