class SubcategoriesController < ApplicationController
 
  #def show
  # @subcategory = Category.find(params[:id])
  #end


  def show
   # @category = Subcategory.find(params[:id])
  end

  def find_by_category
    category = Category.find(params[:category_id])
    subcategories = category.subcategories.find_all
    render json: { subcategories: subcategories }
  end
end