class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token

  # views can call these methods
  helper_method :current_user, :logged_in?

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    session[:session_token] = nil
    if current_user
      current_user.reset_session_token!
    end
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    # double bang gets the truthiness of an object
    # current user -> nil or a User
    # !(nil) -> true      !(User) -> false
    # !!(nil) -> false    !!(User) -> true
    !!(current_user)
  end

  def require_logged_out
    redirect_to users_url if logged_in?
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end
end
