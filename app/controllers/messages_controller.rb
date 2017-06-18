class MessagesController < ApplicationController
  include Secured

  def create
    @message = current_user.messages.build(message_params)
    @message.response = {
      message: @message.message
    }
    @message.direction = "from"
    if @message.save
      lex = Aws::Lex::Client.new(
        access_key_id: Rails.application.secrets.aws_access_key,
        secret_access_key: Rails.application.secrets.aws_secret_access_key,
        region: Rails.application.secrets.aws_region
      )
      response = lex.post_text({
        bot_name: "CoffeeBot",
        bot_alias: "Jarvis",
        user_id: current_user.auth0,
        input_text: @message.message,
      })

      message = Message.create({
        user: current_user,
        direction: "to",
        response: response
      })
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
