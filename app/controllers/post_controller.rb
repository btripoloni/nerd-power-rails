class PostController < ApplicationController
	def index
		d = get_posts
		render json: d
	end
	def create
		@post = Post.create(params[:post])
		@post.save
	end
	private
	def get_posts
		posts = Post.all
		data = []
		posts.each do |post|
			user = User.find_by_id(post.user_id-1)
			d = [
				id: post.id,
				content: post.content,
				created_at: post.created_at,
				updated_at: post.updated_at,
				author_name: user.name,
				author_email: user.email
			]
			data << d
		end
		return data
	end
end