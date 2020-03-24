Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index,:show]
  resources :products, only: [:index, :new, :create]

end
