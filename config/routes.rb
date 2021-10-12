Rails.application.routes.draw do
  # devise_for :admins
  # get 'posts/index'
  # get 'posts/show'
  # get 'users/index'
  # get 'users/show'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#管理者側
  devise_for :admins , controllers: {
     sessions: 'admins/sessions',
     passwords: 'admins/passwords',
     registrations: 'admins/registrations'
  }

  namespace :admin do
    resources :games
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only:[:show, :index]
  end

  # ユーザー側
  devise_for :users , controllers: {
     sessions: 'users/sessions',
     passwords: 'users/passwords',
     registrations: 'users/registrations'
  }
    root to: 'homes#top'
    resources :post_comments, only:[:create, :destroy]
    # resources :posts, only[:index, :show, :create]
    # resources :users, only[:index, :show] #いいね機能


  namespace :user do
    get 'about' => 'homes#about'
    #resources :games, only:[:show,:index]
    #resources :users, only:[:show,index]

  end
end
