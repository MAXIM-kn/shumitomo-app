Rails.application.routes.draw do
  devise_for :users
  root to: 'chat_rooms#index'
  resources :users, only: [:show]
  resources :chat_rooms do
    member do
      get :join
    end
    resources :chat_messages, only: [:index, :create]
  end
  resources :categories, only: [:index]
  resources :direct_rooms, only: [:index, :new, :create]
end