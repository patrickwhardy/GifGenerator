require 'rails_helper'

RSpec.feature "User views all gifs" do
  scenario "they see a page with all gifs" do
    gif1, gif2 = create_list(:gif, 2)

    visit gifs_path

    expect(page).to have_link gif1.image_path, href: gif_path(gif1)
    expect(page).to have_link gif1.image_path, href: gif_path(gif1)
    expect(page).to have_xpath("//img[@src=\"#{gif1.image_path}\"]")
    expect(page).to have_xpath("//img[@src=\"#{gif2.image_path}\"]")
  end

end
