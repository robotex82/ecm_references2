require 'rails_helper'

module Ecm::References
  describe ReferencesController do
    it 'routes to #index' do
      get('/en/references').should route_to('ecm/references/references#index', locale: 'en')
    end # it

    it 'routes to #show' do
      get('/en/references/example-reference').should route_to(
        'ecm/references/references#show',
        locale: 'en',
        id: 'example-reference'
      )
    end # it
  end # describe ReferencesController
end # module Ecm::References
