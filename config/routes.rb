Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only: [:show, :edit, :update]
  resources :avocados, only: [:new, :create, :edit, :update]
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments,  only: [:create, :destroy]
    resource :likes , only: [:create, :destroy]
  end
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end
end
