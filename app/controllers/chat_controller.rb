class ChatController < ApplicationController
  include Secured

  def chat

  end

  def post_text
    message = Message.create({
      user: current_user,
      direction: "from",
      response: {
        message: params[:text]
      }
    })

    lex = Aws::Lex::Client.new(
      access_key_id: Rails.application.secrets.aws_access_key,
      secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region: Rails.application.secrets.aws_region
    )
    response = lex.post_text({
      bot_name: "CoffeeBot",
      bot_alias: "Jarvis",
      user_id: current_user.auth0,
      input_text: params[:text],
    })

    message = Message.create({
      user: current_user,
      direction: "to",
      response: response
    })
  end
end
