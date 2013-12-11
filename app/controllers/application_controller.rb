class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method \
    :current_user,
    :logged_in?

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  def logged_in?
    current_user.present?
  end

  def login(user)
    session[:current_user_id] = user.id
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to do this."
      redirect_to new_session_path(referrer_param => current_path)
    end
  end

  def require_no_login
    if logged_in?
      flash[:error] = "You cannot do this when signed in."
      redirect_to my_profile_path
    end
  end
end
