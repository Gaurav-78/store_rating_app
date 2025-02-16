class OwnersController < ApplicationController
  before_action :authenticate_owner

  def dashboard
    @owner = User.find(session[:user_id])
          @ratings = @store.present? ? @store.ratings : []
  end

  def edit_store
    @store = current_user.store
  end

  def update_store
    @store = current_user.store
    if @store.update(store_params)
      redirect_to owner_dashboard_path, notice: "Store updated successfully."
    else
      render :edit_store
    end
  end

  private

   def authenticate_owner!
    user = User.find_by(id: session[:user_id])
    unless user&.role == "owner"
      redirect_to login_path, alert: "You are not authorized to access this page."
    end
  end

  def store_params
    params.require(:store).permit(:name, :address)
  end
end
