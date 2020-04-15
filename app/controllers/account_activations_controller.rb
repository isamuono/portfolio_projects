class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate   #ユーザーモデルオブジェクト経由でアカウントを有効化する
      log_in user
      flash[:success] = "アカウントが有効になりました!!"
      redirect_to users
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
