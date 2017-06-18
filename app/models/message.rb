class Message < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :direction, presence: true
  attr_accessor :message
  after_create :broadcast

  def broadcast
    ChatChannel.broadcast_to(
      user,
      title: 'Response',
      direction: direction,
      response: response.to_h
    )
  end
end
