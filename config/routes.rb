Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :estates
  root to: 'pages#index'
  get '/estates/#/novogradnja', to: 'estates#novogradnja'

  get 'my_estates' => 'estates#my_estates', as: :my_estates

  get 'novogradnje' => 'estates#novogradnja', as: :novogradnja

  get 'hise' => 'estates#hisa', as: :hisa

  get 'montazne_hise' => 'estates#montazna', as: :montazna

  get 'pocitniske_hise' => 'estates#pocitniski', as: :pocitniski

  get 'poslovni_objekti' => 'estates#poslovni', as: :poslovni

  get 'search' => 'estates#search', as: :search

  get "pages/modal" => 'pages#modal', :as => :modal

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :estates, only: [:index, :show]
      post 'authenticate', to: "authentication#authenticate" 
    end
  end


end
