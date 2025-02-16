class HomeController < ApplicationController
  def index
    @stores = Store.includes(:ratings).order(created_at: :desc).limit(5) # Fetch latest 5 stores
    @top_rated_stores =Store.joins(:ratings).group("stores.id").order("AVG(ratings.value) DESC").limit(3) # Top 3 rated stores
  end
end
