class ApplicationController < ActionController::Base

  helper_method :current_user

  def require_current_user!
    redirect_to new_session_url if current_user.nil?
  end

  def log_in!(user)
    @current_user = user
    session[:session_token] = @current_user.session_token
  end

  def log_out!
    current_user.try(:reset_session_token!)
    # current_user.reset_session_token!
    session[:session_token] = nil

  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])

  end
end
