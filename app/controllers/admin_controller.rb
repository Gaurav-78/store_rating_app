class AdminController < ApplicationController
  before_action :authenticate_admin

  def dashboard
    @users = User.all
    @stores = Store.all
    @ratings = Rating.all
  end

  def users
    @users = User.all
  end

  def stores
    @stores = Store.all
  end

  private

  def authenticate_admin
    unless current_user&.role == "admin"
      redirect_to root_path, alert: "Access denied! Admins only."
    end
  end
end
