Rails.application.routes.draw do
  devise_for :users
  root to: 'cards#index'

  resources :users
  resources :cards
  resources :maps, only: [:index]
end
