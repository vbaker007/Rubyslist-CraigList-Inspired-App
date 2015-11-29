class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.save
    redirect_to @listing
  end

  def search
    @listings = Listing.search(params)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def mylistings
    @listings = Listing.where(user: current_user)
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :city, :state, :zipcode, :category_id, :subcategory_id)
  end
end