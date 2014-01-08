require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
  end

  test "it renders a login form" do
    get :new
    assert_response :success
  end

  test "redirects to my profile path if logged and access new" do
    login_as(@user)
    get :new
    assert_redirected_to my_root_path
  end

  test "it shows error message when wrong credentials are used" do
    post :create
    assert_response :success
    assert_template :new
    assert flash[:error].present?
  end

  test "it logins a user" do
    post :create, { email: @user.email, password: 'qweqwe' }
    assert_redirected_to my_root_path
    assert flash[:notice].present?
  end

  test "redirects to my profile path if logged and access create" do
    login_as(@user)

    post :create, { email: @user.email, password: 'qweqwe' }
    assert_redirected_to my_root_path
  end

  test "it logouts a user" do
    login_as(@user)

    delete :destroy
    assert flash[:notice].present?
    assert_redirected_to new_session_path
  end

end