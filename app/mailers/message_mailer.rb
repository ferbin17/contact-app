class MessageMailer < ApplicationMailer
  
  # Function to send message mail to info@ajackus.com
  def message_mail
    @message = params[:message]
    mail(to: "info@ajackus.com", subject: "Message mail")
  end
end
