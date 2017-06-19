class ChatController < ApplicationController
  include Secured

  def chat
    @message = Message.new
  end

  def delete_history
    current_user.messages.destroy_all
  end
end
