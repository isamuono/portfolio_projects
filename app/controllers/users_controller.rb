class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.role = 1
    @user.image = nil
    @user.description = nil
    @user.remember_digest = nil
    #binding.pry
    if @user.save
      @user.send_activation_email
      redirect_to root_url, success: 'メールを送信しました'
    else
      flash.now[:danger] = "メール送信に失敗しました"
      render :new
    end
  end
  
  def new_manager
  end
  
  def index
    # 有効化されたユーザーのみ表示される
    @users = User.where(activated: FILL_IN).paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    redirect_to root_url #and return unless FILL_IN
  end
  
  def edit
    @users = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:user).permit(:family_name, :first_name, :accountName, :email, :password, :password_confirmation)
    end
end
