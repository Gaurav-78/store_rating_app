class ApplicationController < ActionController::Base
   include AuthenticationHelper
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
   helper_method :current_user, :logged_in?
  allow_browser versions: :modern

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    redirect_to login_path, alert: "Please log in first" unless current_user
  end
  def authenticate_admin
  user = User.find_by(id: session[:user_id])
  unless user&.role == "admin"
    redirect_to root_path, alert: "You are not authorized to access this page."
  end
end
end
