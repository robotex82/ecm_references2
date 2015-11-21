require 'rails_helper'

describe 'ecm/references/categories/show.html.erb' do
  def add_controller_helpers *controllers
    controllers.each { |c| view.singleton_class.class_eval { include c.new._helpers } }
  end

  before do
    add_controller_helpers ApplicationController
    assign(:reference_category,
      FactoryGirl.create(:ecm_references_category, :name => 'Foo')
    )
    render
  end # before

  it "displays the reference categories" do
    rendered.should include('Foo')
  end # it
end # describe 'ecm/references/categories/show.html.erb'

