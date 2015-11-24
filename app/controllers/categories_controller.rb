class CategoriesController < ApplicationController

    def index
      @categories = Category.all
      @community = @categories[0]
      @housing = @categories[1]
      @forsale = @categories[2]
      @gigs = @categories[3]
      @personals = @categories[4]
      @services = @categories[5]
      @jobs = @categories[6]
      @discussionforums = @categories[7]
      @resumes = @categories[8]
    end

    def show
      @category = Subcategory.find(params[:id])
    end

  
end