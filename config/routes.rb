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
  resources :carts, only: :index
  resources :cart_items, only: %i[create update destroy]
  resource :coupon, only: :update
  root 'pages#home'
end
