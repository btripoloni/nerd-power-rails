class PostController < ApplicationController
	def index
		@post = Post.all
		render json: @post
	end
end