module Api
  class PostController < ApplicationController
    def index
      post = Post.all
      render json: post, include: :user, except: :user_id
    end
  end
end