Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :books, only: %i[index show]

  root 'pages#home'

  match '*path' => redirect('/'), via: [:get]
end
