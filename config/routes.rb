Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    resources :likes
  end
  post 'tweets/retweet', to: 'tweets#retweet', as: 'retweet'
  get 'tweet/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tweets#index"
end
