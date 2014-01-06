require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  fixtures :users

  test 'login simple user' do
    visit(root_path)
    assert_page_with_title('Landing page')

    click_link('Sign in')
    assert_page_with_title('Sign in')
    fill_in('email', with: 'simple.user@example.com')
    fill_in('password', with: 'qweqwe')
    click_button('Save changes')

    assert_page_with_title('Words')
  end

end
