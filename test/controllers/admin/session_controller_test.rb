require "test_helper"

class Admin::SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_session_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_session_update_url
    assert_response :success
  end
end
