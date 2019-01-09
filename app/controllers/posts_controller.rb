class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :set_following_users, only: [:index]

  def index
		@posts = @following_users.map(&:posts).flatten.sort.reverse
  end

  def new
    @post = Post.new
  end

  def create
		@post = Post.create params.permit(:content, :image) # *1
    @post.user_id = @current_user.id
    if @post.save
      flash[:secsess] = "投稿しました"
      redirect_to "/"
		end
    @tag = Tag.find_by(content: params[:tag])
    if @tag
      @post_tag_relation = PostTagRelationship.create(post_id: @post.id, tag_id: @tag.id)
    else
			#@new_tag = Tag.create params.permit(:tag) *1でできてこれでできない理由がわからない
			@new_tag = Tag.create(content: params[:tag]) #これで実装可能
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
