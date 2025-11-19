class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin?, :customer_manager?, :employee?

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = LoginUser.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    redirect_to login_path, alert: "ログインしてください" unless logged_in?
  end

  def admin?
    current_user&.lvl == 1
  end

  def customer_manager?
    current_user&.lvl == 2
  end

  def employee?
    current_user&.lvl == 3
  end
end
