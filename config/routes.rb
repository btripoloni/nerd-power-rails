Nerdpower::Application.routes.draw do
  devise_for :users
  root 'home#index'

  authenticate :user do
    scope :user do
      get '/' => 'user#index',          as: :user_feed
      get '/profile/:nickname' => 'user#profile', as: :user_profile
    end
  end

  get '/post', to: "post#index"
end
