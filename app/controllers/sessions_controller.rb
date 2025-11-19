class SessionsController < ApplicationController
  def new
    # すでにログイン済みならメニュー画面へ
    if logged_in?
      redirect_to menu_path
    end
  end

  def create
    user = LoginUser.find_by(login: params[:login])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "ログインしました"
      redirect_to menu_path
    else
      flash[:alert] = "ログインID またはパスワードが違います"
      render :new, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to login_path
  end
end
