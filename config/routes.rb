Rails.application.routes.draw do
  devise_for :users
  root to: 'chat_rooms#index'
  resources :users, only: :show
  resources :chat_rooms, only: [:index, :new, :create, :show, :edit, :update] 
  resources :categories, only: [:index]
end
