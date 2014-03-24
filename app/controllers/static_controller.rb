class StaticController < ApplicationController

  layout 'unauthenticated'

  before_action :require_no_login

  def landingpage
  end

end