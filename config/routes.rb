Rails.application.routes.draw do

  resources :cleaners, only: [:index, :show]
  resources :reservations
  devise_for :users
  root to: 'cleaners#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
