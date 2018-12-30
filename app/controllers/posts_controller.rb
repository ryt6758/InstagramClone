class PostsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :show]

  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create params.permit(:content, :image)
    @post.user_id = @current_user.id
    if @post.save
      flash[:secsess] = "投稿しました"
      redirect_to "/"
    end
    @tag = Tag.find_by(content: params[:tag])
    if @tag
      @post_tag_relation = PostTagRelationship.create(post_id: @post.id, tag_id: @tag.id)
    else
      @new_tag = Tag.create params.permit(:tag)
      @post_tag_relation = PostTagRelationship.create(post_id: @post.id, tag_id: @new_tag.id)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @tags = @post.tags
    @comments = @post.comments
    @like_count = @post.likes.count
  end

end
