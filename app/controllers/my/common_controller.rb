class My::CommonController < ApplicationController
  before_filter :require_login
end