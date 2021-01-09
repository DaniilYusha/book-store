Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }

  resources :books, only: %i[index show]
  resources :settings, only: :index
  resources :addresses, only: :create
  resources :reviews, only: :create
  resources :carts, only: :show
  resources :cart_items, only: %i[create destroy]
  post '/coupon', to: 'coupons#check'
  root 'pages#home'
end
