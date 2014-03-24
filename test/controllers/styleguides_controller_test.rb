require 'test_helper'

class StyleguidesControllerTest < ActionController::TestCase

  test "renders grid page" do
    get :grid
    assert_response :success
  end

  test "renders button page" do
    get :button
    assert_response :success
  end

  test "renders page_navigation page" do
    get :page_navigation
    assert_response :success
  end

end