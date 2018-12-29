class FollowsController < ApplicationController

  def create
    @follow = Follow.create(user_id: @current_user.id, follower_user_id: params[:id])
    redirect_to "/users/#{params[:id]}"
  end

  def destroy
    @follow = Follow.find_by(user_id: @current_user.id, follower_user_id: params[:id])
    @follow.destroy
    redirect_to "/users/#{params[:id]}"
  end

end
