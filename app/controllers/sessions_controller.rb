class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: session_params[:email])
    if !user #データベースにemailで照合 => emailがnilだったらaccontNameで照合
      user = User.find_by(accountName: session_params[:email])
    end
    if user && user.authenticate(session_params[:password])#(:activation, params[:id]) # authenticateメソッド：引数に渡された文字列 (パスワード) をハッシュ化した値と、# データベース内にあるpassword_digestカラムの値を比較
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to user, success: 'ログインに成功しました'
      else
        message  = "このアカウントは有効でありません。"
        message += "お送りしたメールのリンクからアカウントを有効にしてください。"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'メールアドレスとパスワードが一致しません'
      render :new
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  # ユーザーのセッションを永続的にする
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # 永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  private
    def session_params
      params.require(:session).permit(:email, :password, :remember_me)
    end
end