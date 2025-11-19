class PasswordsController < ApplicationController
  before_action :require_login

  def edit
  end

  def update
    @user = current_user

    # --- 現在のパスワードが正しいか確認 ---
    unless @user.authenticate(params[:current_password])
      flash.now[:alert] = "現在のパスワードが違います"
      return render :edit, status: :unprocessable_entity
    end

    # --- 新しいパスワードが空欄の場合 ---
    if params[:password].blank?
      flash.now[:alert] = "新しいパスワードを入力してください"
      return render :edit, status: :unprocessable_entity
    end

    # --- 更新処理 ---
    if @user.update(password: params[:password], password_confirmation: params[:password_confirmation])
      flash[:notice] = "パスワードを変更しました"
      redirect_to menu_path
    else
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end
end
