class Api::V1::MessagesController < ApplicationController
  
  # create function for message
  # Respond either success message or error messages
  def create
    message = Message.new(message_params)
    if message.save
      render json: { success: true , message: [t(:message_created)] }
    else
      render json: { success: false, message: message.errors.full_messages }
    end
  end
  
  private
    # Permit message_params
    def message_params
      params.require(:message).permit(:first_name, :last_name, :email, :phone, 
        :message)
    end
end
