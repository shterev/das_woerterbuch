require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  fixtures :users

  test 'login flow' do
    get new_session_path
    assert_response :success

    post_via_redirect session_path, email: users(:simple_user).email, password: 'qweqwe'
    assert_equal my_root_path, path
    assert flash[:notice].present?
  end

end
