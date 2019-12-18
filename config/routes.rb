Rails.application.routes.draw do
  resources :estates
  root to: 'pages#index'
  get '/estates/#/novogradnja', to: 'estates#novogradnja'
  devise_for :users


end
