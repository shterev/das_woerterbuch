require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  fixtures :users

  test 'register new user' do
    visit(root_path)

    click_link('Sign up')
    assert_page_with_title('Sign up')
    fill_in('user_email', with: 'new.user@example.com')
    fill_in('user_password', with: 'qweqwe')
    fill_in('user_password_confirmation', with: 'qweqwe')
    click_button('Register')

    assert_notice_message('User successfully created!')
    assert_page_with_title('Words')
  end

  test 'login a user' do
    visit(root_path)

    click_link('Sign in')
    assert_page_with_title('Sign in')
    login!(users(:simple_user).email)

    assert_page_with_title('Words')
  end

  test 'logout a user' do
    login!(users(:simple_user).email)
    click_button('Sign out')

    assert_notice_message('Signed out!')
    assert_page_with_title('Sign in')
  end

end