Rails.application.routes.draw do
  get 'product/index'
  root 'items#index'
    resources :product, only: [:index,]
end
