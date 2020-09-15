Rails.application.routes.draw do
  root 'pages#home'

  resources :books, only: [:index, :show]
end
