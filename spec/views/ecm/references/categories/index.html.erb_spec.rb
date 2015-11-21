require 'rails_helper'

describe 'ecm/references/categories/index.html.erb' do
  def add_controller_helpers *controllers
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
  end

  describe 'with 2 reference categories' do
    before do
      assign(:reference_categories, [
        stub_model(Ecm::References::Category, :name => 'Foo'),
        stub_model(Ecm::References::Category, :name => 'Bar')
      ])
      render
    end # before

    it "displays all the reference categories" do
      rendered.should include('Foo')
      rendered.should include('Bar')
    end # it
  end # describe 'with 2 reference categories'
end # describe 'ecm/references/categories/index.html.erb'

