class UsersController < ApplicationController

	def new
		@user = User.new
		flash[:sucsess] = "保存に成功しました"
	end

	def create
		@user = User.create params.require(:user).permit(:email, :password, :name)
		flash[:sucsess] = "保存に成功しました"
		redirect_to "/users/new"
	end

end
