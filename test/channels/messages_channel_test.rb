require "test_helper"

class MessagesChannelTest < ActionCable::Channel::TestCase
  test "subscribed to channel" do
    subscribe
    assert subscription.confirmed?
    assert_has_stream "MessagesChannel"
  end

  test "receives message broadcast" do
    # First, subscribe to the channel
    subscribe

    # Create a message to trigger the broadcast
    message = Message.create(body: "Test message")

    # Assert that the broadcast happens on the "MessagesChannel" stream
    assert_broadcast_on("MessagesChannel", body: "Test message")
  end
end
