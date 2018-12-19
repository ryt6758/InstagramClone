class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create params.require(:user).permit(:email, :password, :name)
		if @user
			session[:user_id] = @user.id
			flash[:sucsess] = "保存に成功しました"
			redirect_to "/users/new"
		end
	end

end
