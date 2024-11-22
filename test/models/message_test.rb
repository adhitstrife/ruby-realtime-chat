require "test_helper"
require 'minitest/mock'


class MessageTest < ActiveSupport::TestCase
  test "should broadcast message after creation" do
    message = Message.new(body: "Hello, World!")

    # Create a mock to intercept the broadcast call
    mock_broadcast = Minitest::Mock.new
    ActionCable.server.stub(:broadcast, mock_broadcast) do
      # Save the message, which should trigger the broadcast
      message.save
    end

    # Expect that ActionCable.server.broadcast will be called once with the correct arguments
    mock_broadcast.expect(:call, nil, ["MessagesChannel", {
      id: message.id,
      body: message.body
    }])

    # Verify the expectations
    mock_broadcast.verify
  end
end
