require 'rails_helper'

describe 'ecm/references/categories/show.html.haml' do
  def add_controller_helpers(*controllers)
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
    assign(:category,
           FactoryGirl.create(:ecm_references_category, name: 'Foo')
          )
    render
  end

  it 'displays the reference categories' do
    rendered.should include('Foo')
  end
end
