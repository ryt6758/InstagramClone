class ApplicationController < ActionController::Base
	
	# 全体的なこと
	# Ruby（というかプログラミング全体的は話）では、tabを使わず、半角スペースを使うことが多い
	# エディタのデフォルト設定で、tab区切りになっていると思われるので、設定含め要修正
	# （tabインデントが環境依存になり崩れやすいため）

	before_action :set_current_user

	def  set_current_user
		@current_user = User.find_by(id: session[:user_id])
	end

	# @memo 名付けが悪い。checkでは一体何をチェックしているのか明確ではない？
	# すでにログインしているか？
	# ユーザーが存在するか？
	# など複数の意味が想定されてしまう
	def login_check
		if @current_user == nil
			flash[:sucsess] = "ログインまたは会員登録をしてください"
			redirect_to "/login_form"
		end
	end

end
