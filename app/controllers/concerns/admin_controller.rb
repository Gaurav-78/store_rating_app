class AdminController < ApplicationController
  before_action :require_admin

  def dashboard
    # Admin-specific logic
  end

  private

  def require_admin
    redirect_to root_path, alert: "Access denied" unless current_user&.admin?
  end
end
