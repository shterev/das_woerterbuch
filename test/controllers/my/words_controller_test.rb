require 'test_helper'

class My::WordsControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
  end

  test "renders the index page" do
    login_as(@user)
    get :index
    assert_response :success
  end

  test "should redirect to login page if not logged in" do
    get :index
    assert_response :redirect
    assert_redirected_to new_session_path(referrer: my_words_path)
  end

end