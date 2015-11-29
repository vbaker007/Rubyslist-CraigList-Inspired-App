class ListingsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :is_user?, only: [:edit, :update, :delete]
  
  def index
    @listings = Listing.all
  end
  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if  @listing.save
        @listing.user = current_user
        redirect_to @listing
    else
        flash[:danger] = @listing.errors.full_messages.to_sentence
        render 'new'
    end
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

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to @listing
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to root_path
  end

  def is_user?
    @listing = Listing.find(params[:id])
    unless current_user = @listing.user
      redirect_to root_path, alert: "Sorry, you are not the author of this listing."
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :city, :state, :zipcode, :category_id, :subcategory_id)
  end
end