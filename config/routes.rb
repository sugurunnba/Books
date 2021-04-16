Rails.application.routes.draw do
  # 以下deviseのルートパス
  devise_for :users

  
  root to: 'user/users#top'
  

  # 以下userのルートパス
  scope module: :user do
    resources :users, only: [:show, :edit, :update] do
      get 'top'
    end
  end

end
