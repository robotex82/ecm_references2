require 'rails_helper'

describe 'ecm/references/references/index.html.haml' do
  def add_controller_helpers(*controllers)
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
  end

  describe 'references rendering' do
    before do
      @references = FactoryGirl.create_list(:ecm_references_reference, 3)
      assign(:references, Kaminari.paginate_array(@references).page(1))
      render
    end

    it { @references.each { |r| expect(rendered).to include(r.name) } }
  end
end
