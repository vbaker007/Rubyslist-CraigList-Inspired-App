class CategoriesController < ApplicationController

    def index
      @categories = Category.all
      #@communities = Community.all
      @community = @categories[0]
      #@category = @subcategories[0]
      #@subcategories = Subcategory.all
      @housing = @categories[1]
    end
  
end