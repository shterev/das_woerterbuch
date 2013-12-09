require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
  end
  
  # GET /users/new
  test "rendering signup page is successful" do
    get :new
    assert_response :success
  end

  # POST /users/create
  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: 'new.user@example.com', password: 'qweqwe', password_confirmation: 'qweqwe' }
      assert_redirected_to new_user_path
      assert_response :redirect
      assert flash[:notice].present?
    end
  end

  # POST /users/create
  test "should render user new action" do
    post :create, user: { email: 'invalid' }

    assert_template :new
    assert_response :success
    assert flash[:error].present?
  end

end