Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :books,only: [:show, :index, :edit, :create, :update]do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end