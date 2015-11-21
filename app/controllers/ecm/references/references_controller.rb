module Ecm::References
  class ReferencesController < ApplicationController
    def index
      @references = Reference.with_public_visibility.all
    end # def

    def show
      @reference = Reference.with_public_visibility.find(params[:id])
    end # def
  end # class ReferencesController < ApplicationController
end # module Ecm::References

