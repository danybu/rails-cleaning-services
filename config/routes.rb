Rails.application.routes.draw do

  resources :cleaners, only: [:index, :show, :new, :create]
  resources :reservations do
      resources :reviews, only: [:create, :new]
  end
 root to: 'cleaners#index'
 devise_for :users
 resources :users, only: [:show, :edit, :update]
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

