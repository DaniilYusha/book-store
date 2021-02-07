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
  resource :cart, only: :show
  resources :order_items, only: %i[create update destroy]
  resource :coupon, only: :update
  resources :checkout, param: :step, only: %i[show update]
  root 'pages#home'
end
