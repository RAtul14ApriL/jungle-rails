require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create({ first_name: "John", last_name: "Doe", email: "test@test.com", password: "ABCD1234", password_confirmation: "ABCD1234" })
  end
  scenario "They can navigate from home page to the product detail page by clicking on a product" do
      # ACT
      visit root_path
      
      # CLICK
      click_on 'Login'
      
      # ACT
      visit login_path
      
      # Fill the Login Form
      fill_in 'email', with: 'test@test.com'
      fill_in 'password', with: 'ABCD1234'
      
      # Submit
      click_on 'Submit'
      
      # ACT
      visit root_path
      
      # DEBUG
      save_screenshot

      # VERIFY
      expect(page).to have_text 'Signed in as John'
    end
  end
