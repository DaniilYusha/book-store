Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }

  resources :books, only: %i[index show]
  resources :settings, only: :index
  resources :addresses, only: %i[create update]
  root 'pages#home'
end
