class Message < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :message,
    message: :cant_be_blank  # validate presence of attributes
  validates :email, format: { 
    with: /\A([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)\z/, 
    message: :invalid_email_format
  }, if: Proc.new{|c| c.email.present?} # validate email pattern if present
  after_create :send_mail # callback to send mail after message creation
  
  # returns full name
  def full_name
    first_name.to_s + " " + last_name.to_s
  end
  
  # returns displayable attributes of message model
  def displayable_details
    attributes.except("id", "created_at", "updated_at")
  end
  
  private
    # call message mail of MessageMailer for sending mail
    def send_mail
      MessageMailer.with(message: self).message_mail.deliver_now
    end
end
