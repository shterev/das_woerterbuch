require 'test_helper'

class My::WordsControllerTest < ActionController::TestCase

  def setup
    @user = users(:simple_user)
    @user_with_word = users(:user_with_word)
    @word = words(:noun)
    @user_word = words(:user_word)
  end

  test "renders the index page" do
    login_as(@user)
    get :index
    assert_response :success
  end

  test "render correct word types" do
    login_as(@user_with_word)

    # Create some additional words
    @user_with_word.words << Noun.create(foreign_form: 'noun1', known_form: 'noun1')
    @user_with_word.words << Noun.create(foreign_form: 'noun2', known_form: 'noun2')

    # Check word inventory
    Word.inheritors.each do |word_type|
      get :index, type: word_type
      expect = @user_with_word.words.where(type: word_type).count
      have = assigns(:words).count
      assert have == expect, "Expected to receive #{expect} #{word_type}s, but it got #{have}."
    end
  end

  test "should redirect to login page if not logged in" do
    get :index
    assert_redirected_to new_session_path(referrer: my_words_path)
  end

  test "renders the new page" do
    login_as(@user)
    get :new, type: 'Noun'
    assert_response :success
  end

  test "redirect to the words index if no word type specified" do
    login_as(@user)
    get :new
    assert_redirected_to my_words_path
  end

  test "redirect to the words index if word type doesn't exist" do
    login_as(@user)
    get :new, type: 'NonExistingWord'
    assert_redirected_to my_words_path
  end

  test "renders show" do
    login_as(@user_with_word)
    get :show, { id: @user_word.id }
    assert_response :success
  end

  test "create new word" do
    login_as(@user)
    assert_difference('Word.count', 1) do
      post :create, { type: 'Noun', word: { known_form: 'man', foreign_form: 'Mann', user_id: @user.id } }
    end
    assert_redirected_to my_words_path
    assert flash[:notice].present?
  end

  test "renders edit page" do
    login_as(@user_with_word)
    get :edit, { id: @user_word.id }
    assert_response :success
  end

  test "updates a word" do
    login_as(@user_with_word)
    patch :update, { id: @user_word.id, word: { known_form: 'new_known_form', foreign_form: 'new_foreign_form' } }
    assert flash[:notice].present?
    assert_redirected_to my_words_path
  end

  test "destroys a word" do
    login_as(@user_with_word)

    assert_difference('Word.count', -1) do
      delete :destroy, { id: @user_word.id }
    end

    assert flash[:notice].present?
    assert_redirected_to my_words_path
  end

  test "doesn't destroy a word if it doesn't belong to a user" do
    login_as(@user_with_word)

    assert_raises(ActiveRecord::RecordNotFound) do
      delete :destroy, { id: @word.id }
    end

  end

end