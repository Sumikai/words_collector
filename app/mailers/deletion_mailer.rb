class DeletionMailer < ApplicationMailer
  def send_when_destroy(user)
    @user = user
    
    mail to: user.email, subject: "ご登録情報を破棄しました。"
  end
end
