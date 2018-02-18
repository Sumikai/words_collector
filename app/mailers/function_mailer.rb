class FunctionMailer < ApplicationMailer
  def send_when_create(user)
    @user = user
    
    mail to: user.email, subject: "ご登録ありがとうございます。"
  end
end
