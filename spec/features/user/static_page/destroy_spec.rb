require "rails_helper"

feature "Destroy Static Page" do
  include_context "current user signed in"

  background do
    static_page = FactoryBot.create :static_page
    visit static_page_path(static_page)
  end

  scenario "Admin clicks to remove" do
    click_on "Remove"
    expect(page).to have_content("Static page successfully removed")
  end
end
