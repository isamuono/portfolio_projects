class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger
  
  #include CommonActions
  helper_method :current_user, :logged_in?
  
  # 記憶トークンcookieに対応するユーザーを返す
  def current_user
    if (user_id = session[:user_id]) #ユーザーIDのセッションが存在すれば、、、
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      #旧(引数不足) if user && user.authenticated?(cookies[:remember_token])
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    forget(current_user)  #次回メンタリングでもう一度確認
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end
  
  def login_check
    unless logged_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end
end
