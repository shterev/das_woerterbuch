require 'capybara_helper'

# Simplecov
require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  fixtures :all

  def login_as(user)
    @request.session[:current_user_id] = user ? user.id : nil
  end
end
