require 'test_helper'

class StaticControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
  end

  test "it should render the landing page" do
    get :landingpage
    assert_response :success
  end

  test "redirected to logged user root path" do
    login_as(@user)

    get :landingpage
    assert_redirected_to my_root_path
  end

end