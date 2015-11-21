require 'rails_helper'

module Ecm::References
  describe CategoriesController do
    it 'routes to #index' do
      get('/en/reference-categories').should route_to('ecm/references/categories#index', :locale => 'en')
    end # it

    it 'routes to #show' do
      get('/en/reference-categories/example-reference-category').should route_to(
        'ecm/references/categories#show',
        :locale => 'en',
        :id     => 'example-reference-category'
      )
    end # it
  end # describe CategoriesController
end # module Ecm::References
