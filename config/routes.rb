Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
  get 'addresses', to: 'users/registrations#new_address'
  post 'addresses', to: 'users/registrations#create_address'
  root 'products#index'
  resources :products, only: [:index,:show]
  resource :user, only: [:show, :edit, :update] do
    collection do
      get'logout'
    end
    resources :cards, only: [:index, :new]    
end