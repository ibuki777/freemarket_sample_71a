Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  resources :products, only: [:index, :destroy]
end
