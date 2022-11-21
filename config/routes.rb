Rails.application.routes.draw do
  devise_for :users
  root to: 'chat_rooms#index'
  resources :users, only: [:show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
    resources :direct_rooms, only: [:new, :create] do
      resources :direct_messages, only: [:index, :create]
    end
  end
  resources :chat_rooms do
    collection do
      get 'search'
    end
    member do
      get :join
    end
    member do
      get :withdrawal
    end
    resources :chat_messages, only: [:index, :create]
  end
  resources :categories, only: [:index]
end