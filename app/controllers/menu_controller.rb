class MenuController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def require_login
    redirect_to login_path, alert: "ログインしてください" unless session[:user_id]
  end
end
