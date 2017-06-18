class ChatController < ApplicationController
  def chat

  end

  def post_text
    lex = Aws::Lex::Client.new(
      access_key_id: Rails.application.secrets.aws_access_key,
      secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region: Rails.application.secrets.aws_region
    )
    response = lex.post_text({
      bot_name: "CoffeeBot",
      bot_alias: "Jarvis",
      user_id: "abc",
      input_text: params[:text],
    })

    ActionCable.server.broadcast(
      'chat',
      title: 'Response',
      response: response
    )
  end
end
