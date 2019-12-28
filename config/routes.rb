Rails.application.routes.draw do
  resources :estates
  root to: 'pages#index'
  get '/estates/#/novogradnja', to: 'estates#novogradnja'

  devise_for :users

  get 'my_estates' => 'estates#my_estates', as: :my_estates

  get 'novogradnje' => 'estates#novogradnja', as: :novogradnja

  get 'hise' => 'estates#hisa', as: :hisa

  get 'montazne_hise' => 'estates#montazna', as: :montazna

  get 'pocitniske_hise' => 'estates#pocitniski', as: :pocitniski

  get 'poslovni_objekti' => 'estates#poslovni', as: :poslovni


end
