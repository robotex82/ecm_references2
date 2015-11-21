require 'rails_helper'

describe 'ecm/references/references/index.html.erb' do
  def add_controller_helpers *controllers
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
  end

  describe 'with 2 references' do
    before do
      assign(:references, [
        stub_model(Ecm::References::Reference, :name => 'Foo'),
        stub_model(Ecm::References::Reference, :name => 'Bar')
      ])
      render
    end # before

    it "displays all the references" do
      rendered.should include('Foo')
      rendered.should include('Bar')
    end # it
  end # describe 'with 2 references'
end # describe 'ecm/references/references/index.html.erb'

