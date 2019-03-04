Rails.application.routes.draw do
  devise_for :users
  root to: 'cleaners#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
