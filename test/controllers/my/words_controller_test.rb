require 'test_helper'

class My::WordsControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
    @word = words(:noun)

    @user.words << @word
    @user.save!
  end

  test "renders the index page" do
    login_as(@user)
    get :index
    assert_response :success
  end

  test "should redirect to login page if not logged in" do
    get :index
    assert_redirected_to new_session_path(referrer: my_words_path)
  end

  test "renders the new page" do
    login_as(@user)
    get :new
    assert_response :success
  end

  test "create new word" do
    login_as(@user)
    post :create, { word: { known_form: 'man', foreign_form: 'Mann', type: 'Noun', user_id: @user.id } }
    assert_redirected_to my_words_path
    assert flash[:notice].present?
  end

  test "renders edit page" do
    login_as(@user)
    get :edit, { id: @word.id }
    assert_response :success
  end

end