Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'

  end
  
  root "products#index"
  
 
  resources :products do
    resources :comments, only: [:create]
    resources :orders, only: [:new, :create]
  end
  resources :searches, only: [:index]
  

  resource :user, only: [:show, :edit, :update] do
    collection do
      get'logout'
      get'bought'
      get'solded'
    end
  end
  resources :cards, only: [:index, :new, :create, :destroy]

  post   '/like/:product_id' => 'likes#like',   as: 'like'
  delete '/like/:product_id' => 'likes#unlike', as: 'unlike'
end
