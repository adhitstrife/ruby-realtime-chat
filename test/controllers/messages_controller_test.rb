require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)  # Assuming you have a fixture for a sample message
  end

  test "should get index" do
    get messages_url
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  test "should show message" do
    get message_url(@message)
    assert_response :success
    assert_includes @response.body, @message.body
  end

  test "should create message" do
    assert_difference('Message.count') do
      post messages_url, params: { message: { body: "New message" } }
    end
    assert_response :created
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete message_url(@message)
    end
    assert_response :no_content
  end
end
