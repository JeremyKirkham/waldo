class Message < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :direction, presence: true
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
