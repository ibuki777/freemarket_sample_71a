Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  resources :products, only: [:index]
  resource :user, only: [:show, :edit, :update] do
    collection do
      get'logout'
    end
    resources :cards, only: [:index, :new]
  end
end
