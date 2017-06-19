class MessagesController < ApplicationController
  include Secured

  def create
    @message = current_user.messages.build(message_params)
    @message.response = {
      message: @message.message
    }
    @message.direction = "from"
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
