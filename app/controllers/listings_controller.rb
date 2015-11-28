class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def search
    @listings = Listing.search(params)
  end

  def show
    @listings = Listing.find(params[:id])
  end
  private

  def listing_params
    params.require(:listing).permit(:title, :description, :city, :state, :zipcode, :category_id, :subcategory_id)
  end
end