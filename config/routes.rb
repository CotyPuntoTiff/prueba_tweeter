Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :tweets do
    resources :likes
  end

  get 'tweet/new'
  get 'users/:id', to: 'users#show', as: 'user_profile'
  get 'api/news', to: 'tweets#api'
  post 'tweets/retweet', to: 'tweets#retweet', as: 'retweet'
  post 'friends', to: "friends#create", as: 'friends'
  delete 'friends/:id', to: 'friends#destroy', as: 'delete_friend'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tweets#index"
end
