Rails.application.routes.draw do
  resources :estates
  root to: 'pages#index'
  devise_for :users


end
