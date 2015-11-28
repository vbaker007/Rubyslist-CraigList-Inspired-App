class Listing < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  geocoded_by :full_address
  #geocoded_by :full_address
  after_validation :geocode

  #def full_address
  #  [city, state, zipcode].join(', ')
  #end
  def full_address
  [city, state, zipcode].compact.join(', ')
  end

  def self.search(params)
    listings = Listing.where(category_id: params[:category].to_i)
    listings = listings.where("title LIKE ? or description LIKE ?", params[:search], params[:search]) if params[:search].present?
    listings = listings.near(params[:location], 20) if params[:location].present?
    listings
  end
end