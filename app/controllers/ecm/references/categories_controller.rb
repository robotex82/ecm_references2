module Ecm::References
  class CategoriesController < Configuration.base_controller.constantize
    def index
      @categories = Category.with_public_visibility.page(params[:page]).per(5)
    end

    def show
      @category = Category.with_public_visibility.find(params[:id])
    end
  end
end
