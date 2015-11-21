module Ecm::References
  class CategoriesController < ApplicationController
    def index
      @reference_categories = Category.with_public_visibility.all
    end # def

    def show
      @reference_category = Category.with_public_visibility.find(params[:id])
    end # def
  end # class CategoriesController < ApplicationController
end # module Ecm::References
