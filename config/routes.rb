Rails.application.routes.draw do
  root to: "posts#index"
<<<<<<< Updated upstream
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

=======
  post '/posts/guest_sign_in', to: 'posts#guest_sign_in'
>>>>>>> Stashed changes
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
