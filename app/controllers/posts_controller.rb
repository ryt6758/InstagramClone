class PostsController < ApplicationController

	def index
		@posts = Post.all.order(created_at: "DESC")
	end

	def new
		@post = Post.new
	end

	# def create
	# 	@post = Post.create params.require(:post).permit(:content, :image)
	# 	redirect_to @post
	# end

	def show
		@post = Post.find_by(id: params[:id])
	end

end
