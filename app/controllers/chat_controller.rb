class ChatController < ApplicationController
  include Secured

  def chat
    @message = Message.new
  end
end
