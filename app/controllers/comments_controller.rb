class CommentsController < ApplicationController

  before_action :authenticate_user

  def create
    ajax_create

    # @comment = Comment.new params.require(:comment).permit(:content)
    # @comment.user_id = @current_user.id
    # @comment.post_id = params[:post_id]
    # if @comment.save
    #   flash[:sucsess] = "コメントを投稿しました"
    #   redirect_to "/posts/#{params[:post_id]}"
    # else
    #   flash[:fail] = "コメントを入力してください"
    #   redirect_to "/posts/#{params[:post_id]}"
    # end
  end

  def ajax_create
    @comment = Comment.new params.require(:comment).permit(:content)
    @comment.user_id = @current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      @json_response = {
        comment_content: @comment.content,
        comment_id: @comment.id,
        user_id: @current_user.id,
        user_name: @comment.user.name,
        create_date: @comment.created_at,
      }
      render :json => @json_response
    else
      redirect_to "/posts/#{params[:post_id]}"
    end
    # respond_to do |format|
    #   if @comment.save
    #     @json_response = {
    #       comment: @comment.content,
    #       user: @comment.user.name,
    #       date: @comment.created_at,
    #     }
    #     format.html { redirect_to "/posts/#{params[:post_id]}" }
    #     format.json {render :json => @json_response }
    #   else
    #     format.html { redirect_to "/posts/#{params[:post_id]}" }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    if @comment.destroy
      flash[:fail] = "コメントを削除しました"
      redirect_to "/posts/#{params[:id]}"
    end
	end

end
