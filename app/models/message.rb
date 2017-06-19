class Message < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :direction, presence: true
  attr_accessor :message
  after_save :broadcast
  after_save :lexify,
    if: Proc.new { |msg| msg.direction == 'from' }

  def broadcast
    ChatChannel.broadcast_to(
      user,
      title: 'Response',
      direction: direction,
      response: response.to_h
    )
  end

  def lexify
    lex = Aws::Lex::Client.new(
      access_key_id: Rails.application.secrets.aws_access_key,
      secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region: Rails.application.secrets.aws_region
    )
    rsp = lex.post_text({
      bot_name: "CoffeeBot",
      bot_alias: "Jarvis",
      user_id: user.auth0,
      input_text: response["message"],
    })

    message = Message.create({
      user: user,
      direction: "to",
      response: rsp
    })
  end
end
