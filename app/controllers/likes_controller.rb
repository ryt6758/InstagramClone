class LikesController < ApplicationController

  before_action :authenticate_user

  def create
    logger.debug("create呼ばれたよ")
    @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])

    # json_response = {
    #   likes_count: Like.all.length,
    # }

    # render :json => json_response

    respond_to do |format|
      if @like.save
        json_response = {
          likes_count: Like.where(post_id: params[:post_id]).length,
          most_recently_liked_post: 3, # 一番最近likeされたpostを一緒に返す
        }

        format.html { redirect_to "/posts/#{params[:post_id]}" }
        format.json { render :json => json_response }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
    @like.destroy
	  redirect_to "/posts/#{params[:post_id]}"
  end

end
