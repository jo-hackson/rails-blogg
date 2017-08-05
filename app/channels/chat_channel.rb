class ChatChannel < Application::Channel

  # called when consumer has successfully become a subscriber of this channel
  def subscribed
  end
end

# consumer can be subscribed to this channel
# consumers subscribe to channels acting as subscribers
# connection is called subscription
# produced messages are then routed to these channel subscriptions based on an identified sent by the cable consumer
