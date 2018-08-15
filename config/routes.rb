Rails.application.routes.draw do
  resources :users, only: [:create, :update, :destroy, :show]
  get '/users/search', to: 'users#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
