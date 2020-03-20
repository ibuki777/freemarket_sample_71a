Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  resources :products, only: [:index]
  resource :user, only: [:show]
end
