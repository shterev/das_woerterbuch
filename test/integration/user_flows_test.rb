require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  fixtures :users

  setup do
    Capybara.reset!
  end

  test 'register new user' do
    visit(root_path)
    assert_page_with_title('Landing page')

    click_link('Sign up')
    assert_page_with_title('Sign up')
    fill_in('user_email', with: 'new.user@example.com')
    fill_in('user_password', with: 'qweqwe')
    fill_in('user_password_confirmation', with: 'qweqwe')
    click_button('Register')

    assert_page_with_title('Words')
  end

  test 'login a user' do
    visit(root_path)
    assert_page_with_title('Landing page')

    click_link('Sign in')
    assert_page_with_title('Sign in')
    fill_in('email', with: 'simple.user@example.com')
    fill_in('password', with: 'qweqwe')
    click_button('Login')

    assert_page_with_title('Words')
  end

end
