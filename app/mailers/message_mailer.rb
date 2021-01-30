class MessageMailer < ApplicationMailer
  
  def message_mail
    @message = params[:message]
    mail(to: "info@ajackus.com", subject: "Message mail")
  end
end
