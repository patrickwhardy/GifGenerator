require 'rails_helper'

RSpec.feature "User views individual gifs" do
  scenario "link sends user to the image's show page" do
    gif1, gif2 = create_list(:gif, 2)

    visit gifs_path
    click_link gif1.image_path
# save_and_open_page
    assert_equal gif_path(gif1), current_path
    expect(page).to have_xpath("//img[@src=\"#{gif1.image_path}\"]")
  end

  scenario "user can see gif's category in index" do
    category = Category.create(title: "Surreal")
    gif = category.gifs.create(image_path: "http://49.media.tumblr.com/0d5ed85f652a0dd357d66221a0cb04e7/tumblr_nyxrlsrDsI1s5f7v4o1_1280.gif")

    visit gifs_path
    click_link(gif.image_path)
    expect(page).to have_content "Surreal"
  end

end
