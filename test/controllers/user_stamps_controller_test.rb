require "test_helper"

class UserStampsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_stamps_index_url
    assert_response :success
  end
end
