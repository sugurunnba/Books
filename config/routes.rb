Rails.application.routes.draw do


  # 以下deviseのルートパス
  devise_for :users
  devise_for :admins


  root to: 'user/users#top'


  # 以下userのルートパス
  scope module: :user do
    resources :users, only: [:show, :edit, :update] do
      get 'top'
    end
  end

  scope module: :user do
    resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :book_comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
    end
  end

  # 以下adminのルートパス
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :books, only: [:index, :show, :edit, :update, :destroy]
  end


end
