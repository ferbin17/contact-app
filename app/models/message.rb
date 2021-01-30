class Message < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :message, message: :cant_be_blank
  validates :email, format: { 
    with: /\A([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)\z/, 
    message: :invalid_email_format
  }, if: Proc.new{|c| c.email.present?}
  after_create :send_mail
  
  def full_name
    first_name + " " + last_name
  end
  
  def displayable_details
    attributes.except("id", "created_at", "updated_at")
  end
  
  private
    def send_mail
      MessageMailer.with(message: self).message_mail.deliver_now
    end
end
