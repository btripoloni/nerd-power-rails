Nerdpower::Application.routes.draw do
  devise_for :users
  root 'home#index'

  authenticate :user do
    scope :user do
      get '/' => 'user#index',          as: :user_feed
      get '/profile/:nickname' => 'user#profile', as: :user_profile
    end
  end
  namespace :api do
    scope :post do
      get     "/", to: "post#index"
      post    "/", to: "post#create"
      delete  "/:id", to: "post#destroy"
    end
    scope :user do
      get "/", to: "user#index"
    end
  end
end
