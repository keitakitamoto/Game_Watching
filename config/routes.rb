Rails.application.routes.draw do
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
    #resources :post_comments, only:[:create, :destroy]
    # resources :users, only[:index, :show] #いいね機能


  namespace :user do
    #get "users/unsubscribe" => "users#unsubscribe"
    resources :users, only:[:show, :index, :edit, :update] do
      collection do
        get :unsubscribe
        patch :withdraw
      end
      # member do
      #   get :hoge
      # end
    end
    get 'about' => 'homes#about'
    #patch "users/withdraw" => "users#withdraw"
   #掲示板機能のルーティング
    get 'topics/index'
    get 'topics/show/:id' => 'topics#show', as: :topics_show
    post 'topics/create' => 'topics#create'
	  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete
	  #新規書き込みのルーティング
	  post 'post/create' => 'post#create', as: :post_create

    #resources :games, only:[:show,:index]

  end
end
