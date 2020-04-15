class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "[サイト名]アカウント確認のお願い"
  end

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
  def invitation(invitee)
    @invitation = invitee
    mail to: invitee.email, subject: "[サイト名]アカウント作成のお願い"
  end
end
