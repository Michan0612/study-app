Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#home'

  resources :users
  resources :cards
  resources :maps, only: [:index]
  resources :microposts
end
