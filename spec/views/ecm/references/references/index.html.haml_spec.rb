require 'rails_helper'

describe 'ecm/references/references/index.html.haml' do
  def add_controller_helpers *controllers
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
  end

  describe 'with 2 references' do
    before do
      references = [
        build(:ecm_references_reference, name: 'Foo'),
        build(:ecm_references_reference, name: 'Bar')
      ]
      allow(references).to receive(:total_pages) { 1 }
      allow(references).to receive(:current_page) { 1 }
      allow(references).to receive(:limit_value) { 1 }
      assign(:references, references)
      render
    end

    it "displays all the references" do
      rendered.should include('Foo')
      rendered.should include('Bar')
    end
  end
end

