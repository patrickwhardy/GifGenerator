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

    scenario "user favorites a gif" do
      gif1, gif2 = create_list(:gif, 2)

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

      first('.btn').click_on('Save to Favorites')

      expect(current_path).to eq user_gifs_path
      expect(page).to have_content gif1
    end
  end
