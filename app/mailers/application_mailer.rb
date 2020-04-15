class ApplicationMailer < ActionMailer::Base
  default from: "noreply@example.com" #サイトのメールアドレスにする？
  layout 'mailer'
end
