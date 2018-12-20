class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	def create
		@user = User.new params.require(:user).permit(:email, :password, :name)
		if @user.save
			session[:user_id] = @user.id
			flash[:sucsess] = "保存に成功しました"
			redirect_to "/users/new"
		else
			flash[:sucsess] = "正しい値を入力してください"
			render "users/new"
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
		else
			flash[:sucsess] = "メールアドレスまたはパスワードが違います"
			render 'login_form'
		end
	end

	def logout
		session[:user_id] = nil
		flash[:success] = "ログアウトしました"
		redirect_to "/login_form"
	end

end
