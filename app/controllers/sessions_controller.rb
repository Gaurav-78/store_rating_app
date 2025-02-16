class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      # ✅ Redirect Based on User Role
      case user.role
      when "admin"
        redirect_to admin_dashboard_path, notice: "Welcome, Admin!"
      when "owner"
        redirect_to owner_dashboard_path, notice: "Welcome, Store Owner!"
      when "user"
        redirect_to user_dashboard_path, notice: "Welcome, User!"
      else
        redirect_to root_path, alert: "Unknown role. Redirecting to homepage."
      end
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully."
  end
end
