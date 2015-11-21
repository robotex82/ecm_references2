require 'rails_helper'

feature 'admin area' do
  include ActiveAdmin::SignInHelper

  describe 'home page access' do
    background do
      visit '/de/admin'
    end # background

    context 'with correct authentication' do
      background do
        @admin_user = FactoryGirl.create(:admin_user)
        fill_in 'admin_user[email]',    :with => @admin_user.email
        fill_in 'admin_user[password]', :with => @admin_user.password
        find(:xpath, '//input[@type="submit"]').click
      end # background

      it 'should redirect to the admin area home page' do
        page.current_path.should eq('/de/admin')
      end
    end

    context 'with wrong authentication' do
      background do
        fill_in 'admin_user[email]',    :with => 'chuck@example.com'
        fill_in 'admin_user[password]', :with => 'password'
        find(:xpath, '//input[@type="submit"]').click
      end # background

      it 'should redirect to the login page' do
        page.current_path.should eq('/de/admin/login')
      end
    end
  end # describe 'home page access'

  describe 'logout' do
    background do
    I18n.locale = :de
      @admin_user = FactoryGirl.create(:admin_user)
      sign_in_with(@admin_user.email, @admin_user.password)
      click_link('Abmelden')
    end # background

    it 'should redirect to the home page' do
      page.current_path.should eq('/de')
    end
  end # describe 'logout'
end # feature

