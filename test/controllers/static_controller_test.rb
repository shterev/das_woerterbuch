require 'test_helper'

class StaticControllerTest < ActionController::TestCase

  test "it should render the landing page" do
    get :landingpage
    assert_response :success
  end

end