require 'rails_helper'

  RSpec.feature "User can log in and save favorites" do
    scenario "user can create an account" do
      visit new_user_path

      fill_in "Username", with: "Patrick"
      fill_in "Password", with: "password"
      click_button("Create Account")

      expect(current_path).to eq root_path
    end


    scenario "user logs in" do
      visit new_user_path

      fill_in "Username", with: "Patrick"
      fill_in "Password", with: "password"
      click_button("Create Account")

      expect(current_path).to eq root_path

      click_on("Login")

      expect(current_path).to eq '/login'
      fill_in "Username", with: "Patrick"
      fill_in "Password", with: "password"
      click_button("Login")

      # save_and_open_page
      expect(current_path).to eq root_path
      expect(page).to have_content "Welcome Patrick"
    end
  end
