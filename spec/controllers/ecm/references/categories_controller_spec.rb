require 'rails_helper'

module Ecm::References
  describe CategoriesController do
    describe "GET index" do
      before do
        I18n.locale = :en
        @visible_reference_categories = FactoryGirl.create_list(:ecm_references_category, 3, :locale => 'en')
        @invisible_reference_categories = FactoryGirl.create_list(:ecm_references_category, 3, :locale => 'de')
      end # before

      it "assigns all visible reference categories to @reference_categories" do
        get :index, :i18n_locale => :en
        assigns(:reference_categories).should eq(@visible_reference_categories)
      end # if
    end # describe "GET index"

    describe "GET show" do
      before do
        I18n.locale = :en
        @reference_category = FactoryGirl.create(:ecm_references_category, :locale => I18n.locale.to_s)
      end # before

      it "assigns the correct reference category to @reference_category" do
        get :show, :id => @reference_category, :i18n_locale => :en
        assigns(:reference_category).should eq(@reference_category)
      end # if
    end # describe "GET show"
  end # describe CategoriesController
end # module Ecm::References

