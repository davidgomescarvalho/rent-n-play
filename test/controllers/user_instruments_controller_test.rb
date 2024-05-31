require "test_helper"

class UserInstrumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_instruments_index_url
    assert_response :success
  end
end
