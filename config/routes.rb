Rails.application.routes.draw do
  devise_for :users
  root to: 'chat_rooms#index'
  resources :users, only: :show
  resources :chat_rooms 
  resources :categories, only: [:index]
end
