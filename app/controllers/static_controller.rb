class StaticController < ApplicationController

  layout 'unauthenticated'

  before_action :require_no_login

  def landingpage
    # redirect_to my_root_path if logged_in?
  end

end