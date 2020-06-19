Rails.application.routes.draw do
  root to:'home#index'
  get 'home/about'
  post 'home/logout'

  devise_for :users
  resources :books do
    resource :favorites, only:[:create, :destroy]
    #↑ resource の場合、コントローラにidが含まれない
    resources :book_comments, only:[:create, :destroy]
  end
  resources :users, only:[:show, :edit, :update, :index] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only:[:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
