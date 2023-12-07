Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :users, only: [:show, :edit, :update]
  resources :avocados, only: [:new, :create, :edit, :update]
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy] 
  resources :questions do
    resources :answers, only: :create
  end
end
