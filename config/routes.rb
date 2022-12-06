Rails.application.routes.draw do
  get 'statistics/index'
  devise_for :users
  namespace :admin do
      resources :articles
      root to: "articles#index"
  end


  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root "search#index"
  get 'search', to: 'search#search'
  get 'results', to: 'search#results'
  delete 'clear', to: 'statistics#clear'
  resources :statistics , only: [:index]
  resources :articles , only: [:index, :show, :edit, :update, :destroy]
end
