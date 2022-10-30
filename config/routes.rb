Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  resources :users, only: :show
  resources :chat_rooms, only: [:new, :create, :show] do
    resources :categories, only: [:index]
  end
end
