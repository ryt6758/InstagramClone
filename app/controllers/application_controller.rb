class ApplicationController < ActionController::Base

  before_action :set_current_user

  def  set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def set_following_users
    @following_users = @current_user.followings
  end

  def authenticate_user
    if @current_user == nil
      flash[:fail] = "ログインまたは会員登録をしてください"
      redirect_to "/login_form"
    end
  end

end
