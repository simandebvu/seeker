Rails.application.routes.draw do
  get 'statistics/index'
  devise_for :users
  namespace :admin do
      resources :articles

      root to: "articles#index"
    end
  resources :articles

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "search#index"
  get 'search', to: 'search#search'
  get 'results', to: 'search#results'
end
