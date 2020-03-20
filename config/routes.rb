Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  resources :products, only: [:index]
  #ユーザーモデルでは一つのリソースしか参照しないため、単数形にしています。もし、管理者権限などでuser#indexを使ったり、user名を検索するならば複数系にする必要があります。現状そこはなさそう。宮城
  #マイページ経由で
  resource :user, except: [:index,:destroy]
end
