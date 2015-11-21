Rails.application.routes.draw do
  :categories
  :subcategories
  :listings
  root 'categories#index'
end
