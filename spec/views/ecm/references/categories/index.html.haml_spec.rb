require 'rails_helper'

describe 'ecm/references/categories/index.html.haml' do
  def add_controller_helpers *controllers
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
  end

  describe 'with 2 reference categories' do
    before do
      categories = [
        build(:ecm_references_category, name: 'Foo'),
        build(:ecm_references_category, name: 'Bar')
      ]
      allow(categories).to receive(:total_pages) { 1 }
      allow(categories.first).to receive(:depth) { 1 }
      allow(categories.last).to receive(:depth) { 1 }

      assign(:categories, categories)
      render
    end # before

    it "displays all the reference categories" do
      rendered.should include('Foo')
      rendered.should include('Bar')
    end # it
  end
end

