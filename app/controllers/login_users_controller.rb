class LoginUsersController < ApplicationController
  before_action :require_login
  before_action :require_admin
  before_action :set_login_user, only: %i[show edit update destroy delete_confirm]

  # 管理者チェック
  def require_admin
    unless admin?
      redirect_to menu_path, alert: "権限がありません（管理者のみ利用可能）"
    end
  end

  # 一覧
  def index
    @login_users = LoginUser.all
  end

  # 詳細
  def show
  end

  # 新規登録フォーム
  def new
    @login_user = LoginUser.new
  end

  # 新規登録
  def create
    @login_user = LoginUser.new(login_user_params)
    if @login_user.save
      redirect_to login_users_path, notice: 'ユーザーを登録しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 編集フォーム
  def edit
  end

  # 更新
  def update
    if @login_user.update(login_user_params)
      redirect_to login_users_path, notice: 'ユーザーを更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 削除確認
  def delete_confirm
  end

  # 削除
  def destroy
    if @login_user.destroy
      redirect_to login_users_path, notice: 'ユーザーを削除しました。'
    else
      redirect_to login_users_path, alert: '削除に失敗しました。'
    end
  end

  private

  def set_login_user
    @login_user = LoginUser.find(params[:id])
  end

  def login_user_params
    params.require(:login_user).permit(:login, :name, :lvl, :password, :password_confirmation)
  end
end
