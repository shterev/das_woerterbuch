class SessionsController < ApplicationController

  def new
  end

  def create
    redirect_to new_session_path
  end

  def destroy
    redirect_to new_session_path
  end

end