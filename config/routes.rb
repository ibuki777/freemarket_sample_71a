Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  resources :products, only: [:index]
  resource :user, only: [:show] do
    collection do
      get'logout'
    end
  end
end
