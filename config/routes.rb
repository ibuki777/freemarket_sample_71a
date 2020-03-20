Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'products#index'
  resources :products, only: [:index,]

end
