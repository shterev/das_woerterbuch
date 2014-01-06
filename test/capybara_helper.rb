require 'capybara/rails'

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

def assert_page_with_title(title)
  assert find('h1').text == title
end