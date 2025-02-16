class StoresController < ApplicationController
before_action :authenticate_admin, only: [:index]
before_action :authenticate_user
  before_action :set_store, only: [:show]
  
  def index
    @stores = Store.all
  end
  def new
    @store = Store.new
  end

  def show
    @rating = @store.ratings.find_by(user_id: current_user.id) || @store.ratings.new
  end
   def dashboard
    @store = current_user.store
    @ratings = @store.ratings.includes(:user)
    @average_rating = @store.average_rating
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to stores_path, notice: 'Store added successfully.'
    else
      render :new
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to stores_path, notice: 'Store updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to stores_path, notice: 'Store deleted successfully.'
  end

  private
  def store_params
    params.require(:store).permit(:name, :email, :address, :rating)
  end
   def check_store_owner
    unless current_user.store_owner?
      redirect_to root_path, alert: "Unauthorized Access"
    end
  end     

   def set_store
    @store = Store.find_by(id: params[:id])
    unless @store
      redirect_to stores_path, alert: "Store not found"
    end
  end
end