require 'rails_helper'

describe 'ecm/references/categories/index.html.haml' do
  def add_controller_helpers(*controllers)
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
  end

  describe 'categories rendering' do
    before do
      @categories = FactoryGirl.create_list(:ecm_references_category, 3)
      assign(:categories, Kaminari.paginate_array(@categories).page(1))
      render
    end

    it { @categories.each { |c| expect(rendered).to include(c.name) } }
  end
end
