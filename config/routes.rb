Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }

  resources :books, only: %i[index show]
  resources :addresses, only: %i[create update]
  resources :reviews, only: %i[create]
  resources :carts, only: :show
  resources :cart_items, only: %i[create destroy]
  resources :checkout, only: :index
  post '/coupon', to: 'coupons#check'
  get '/checkout_login', to: 'pages#checkout_login'
  root 'pages#home'
end
