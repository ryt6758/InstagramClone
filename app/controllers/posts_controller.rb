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
		@post.user_id = @current_user.id
		if @post.save
			flash[:secsess] = "投稿しました"
			redirect_to "/"
		end
	end

	def show
		@post = Post.find_by(id: params[:id])
		@comments = Comment.where(post_id: params[:id])
	end

	def login_check
		if !@current_user
			flash[:sucsess] = "ログインまたは会員登録をしてください"
			redirect_to "/login_form"
		end
	end

end
