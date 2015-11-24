module Ecm::References
  class ReferencesController < Configuration.base_controller.constantize
    def index
      @references = Reference.with_public_visibility.page(params[:page]).per(5)
    end

    def show
      @reference = Reference.with_public_visibility.find(params[:id])
    end
  end
end
