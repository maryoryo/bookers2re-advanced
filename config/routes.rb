Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: "about"
  
  resources :users, only: [:show,:index,:edit,:update] do
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'foll'
  end
  
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
end