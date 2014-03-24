require 'capybara/rails'

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  teardown do
    Capybara.reset!
  end
end

def assert_page_with_title(title)
  assert find('h1').text == title
end

def assert_notice_message(msg)
  assert_message(:notice, msg)
end

def assert_alert_message(msg)
  assert_message(:alert, msg)
end

def assert_message(type, msg)
  unless page.has_content?(msg)
    raise page.body.inspect
  end
  assert page.has_content?(msg)
end

def login!(email)
  visit(new_session_path)
  fill_in('email', with: email)
  fill_in('password', with: 'qweqwe')
  click_button('Login')
  assert_notice_message('Signed in!')
end