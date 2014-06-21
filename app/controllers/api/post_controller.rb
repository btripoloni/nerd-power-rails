module Api
  class PostController < ApplicationController
    skip_before_filter :verify_authenticity_token
    before_action :authenticate_user!

    def index
      post = Post.includes(:user).all
      render json: post, include: [user:{except: [:created_at, :updated_at]}], except: :user_id
    end

    def create
      parameters = {content: params[:post][:content]}
      @post = current_user.posts.new(parameters)
      if @post.save
        render json: @post, include: [user:{except: [:created_at, :updated_at]}]
      end
    end

    def destroy
      @post = current_user.posts.find_by_id(params[:id]).destroy
      head :ok
    end

    def user
      post = Post.includes(:user).find_by_user_id(params[:id])
      render json: post, include: [user:{except: [:created_at, :updated_at]}], except: :user_id
    end

    private
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
  end
end
