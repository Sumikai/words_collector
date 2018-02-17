class FunctionMailer < ApplicationMailer
  def function_mail(word)
    @word = word
    
    mail to: word.user.email, subject: "Created."
  end
end
