Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :tests, only: [:new, :show, :index, :create, :update, :destroy]
  resources :type_tests
  resources :races
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
