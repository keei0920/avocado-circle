Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "posts#index"
  resources :users, only: [:edit, :update]
  resources :avocados, only: [:new, :create, :edit, :update]
end
