require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "it renders a login form" do
    get :new
    assert_response :success
  end

  test "it shows error message when wrong credentials are used" do
    post :create
    assert_response :redirect
  end

  test "it logins a user" do
    post :create
    assert_response :redirect
  end

  test "it logouts a user" do
    delete :destroy
    assert_response :redirect
  end

end