require 'rails_helper'

  RSpec.feature "User can create an admin account" do
    scenario "user creates admin account" do
      visit new_user_path

      fill_in "Username", with: "Patrick"
      fill_in "Password", with: "password"
      fill_in "Role", with: "admin"
      click_button("Create Account")

      visit new_admin_category_path

      fill_in "Category", with: "Abstract"
      click_button("Create GIF!!!")

      expect(current_path).to eq root_path
    end
  end
