class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    user = User.find_by(session_token: session[:session_token])
  end

  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
