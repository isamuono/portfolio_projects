class InvitationsController < ApplicationController
  def new
    if current_user == nil
      redirect_to root_url
    else
      @invitation = Invitation.new
    end
  end
  
  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.user_id = current_user.id
    if @invitation.save
      @invitation.send_invitation_email
      redirect_to root_url, success: '入力したメールアドレス宛に送信しました'
    else
      flash.now[:danger] = "メール送信に失敗しました"
      render :new
    end
  end
  
  private
    def invitation_params
      params.require(:invitation).permit(:family_name, :first_name, :email)
    end
end
