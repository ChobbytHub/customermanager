require "test_helper"

class LoginUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get login_users_index_url
    assert_response :success
  end

  test "should get show" do
    get login_users_show_url
    assert_response :success
  end

  test "should get new" do
    get login_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get login_users_edit_url
    assert_response :success
  end
end
