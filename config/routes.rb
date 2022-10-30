Rails.application.routes.draw do
  devise_for :users
  root to: 'top#index'
  resources :users, only: :show
  resources :chat_rooms, only: [:new, :create]
end
