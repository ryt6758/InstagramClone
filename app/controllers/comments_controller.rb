class CommentsController < ApplicationController

	before_action :login_check

	def create
		@comment = Comment.new params.require(:comment).permit(:content)
		@comment.user_id = @current_user.id
		@comment.post_id = params[:post_id]
		if @comment.save
			flash[:sucsess] = "コメントを投稿しました"
			redirect_to "/posts/#{params[:post_id]}"
		else
			# flashにメッセージを入れるのは良いが、ここはfailなどのkeyが望ましい（処理に失敗しているので）
			flash[:sucsess] = "コメントを入力してください"
			redirect_to "/posts/#{params[:post_id]}"
		end
	end

	def destroy
		@comment = Comment.find(params[:comment_id])

		# より厳密に処理するのであれば、destroyもcreate同様に成功・失敗の判定をいれるべき
		@comment.destroy
		redirect_to "/posts/#{params[:id]}"
	end


end
