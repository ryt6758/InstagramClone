class PostsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :show]

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
    @like_count = Like.where(post_id: params[:id]).count
  end

end
