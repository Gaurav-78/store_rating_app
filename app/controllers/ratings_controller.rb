class RatingsController < ApplicationController
  before_action :authenticate_user

  def new
    @store = Store.find(params[:store_id])
    @rating = Rating.new
  end

  def create
    @rating = current_user.ratings.build(rating_params)
    if @rating.save
      redirect_to stores_path, notice: "Rating submitted successfully"
    else
      render :new
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      redirect_to stores_path, notice: "Rating updated successfully"
    else
      render :edit
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:store_id, :score)
  end
end
