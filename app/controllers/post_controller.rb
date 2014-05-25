class PostController < ApplicationController
	def index
		@post = Post.all
		render json: @post, include: [user:{except: [:created_at, :updated_at]}], except: [:user_id]
	end
	def create
		@post = Post.create(params[:post])
		@post.save
	end
end