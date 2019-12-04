Rails.application.routes.draw do
  resources :tests, only: [:new, :show, :index, :create, :update, :destroy]
  resources :type_tests
  resources :races
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
