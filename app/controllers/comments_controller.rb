class CommentsController < ApplicationController

	def create
		@comment = Comment.new params.require(:comment).permit(:content)
		@comment.user_id = @current_user.id
		@comment.post_id = params[:id]
		if @comment.save
			flash[:sucsess] = "コメントを投稿しました"
			redirect_to "/posts/#{params[:id]}"
		else
			flash[:sucsess] = "コメントを入力してください"
			redirect_to "/"
		end
	end


end
