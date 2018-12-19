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

	def login_form
	end

	def login
		@user = User.find_by(email: params[:email], password: params[:password])
		if @user
			session[:user_id] = @user.id
			flash[:sucsess] = "ログインしました"
			redirect_to "/"
		end
	end

	def logout
		session[:user_id] = nil
		flash[:success] = "ログアウトしました"
		redirect_to "/login_form"
	end

end
