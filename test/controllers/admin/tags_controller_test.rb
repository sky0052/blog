require "test_helper"

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_tags_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_tags_destroy_url
    assert_response :success
  end
end
