class SessionsController < ApplicationController

  before_action :require_login,    only: [:destroy]
  before_action :require_no_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      login(user)
      redirect_to back_or_default(my_root_path), notice: 'Signed in!'
    else
      flash.now[:error] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to new_session_path, notice: 'Signed out!'
  end

end