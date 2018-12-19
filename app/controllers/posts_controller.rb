class PostsController < ApplicationController

	before_action :login_check, except: :index

	def index
		@posts = Post.all.order(created_at: "DESC")
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create params.require(:post).permit(:content, :image)
		@post.user_id = @current_user
		if @post.save
			flash[:secsess] = "投稿しました"
			redirect_to "/"
		end
	end

	def show
		@post = Post.find_by(id: params[:id])
	end

	def login_check
		if session[:user_id]
			@current_user = session[:user_id]
		else
			redirect_to "/users/new"
		end
	end

end
