require "rails_helper"

feature "Create Static Page" do
  include_context "current user signed in"

  background do
    static_page = FactoryBot.create :static_page
    visit edit_static_page_path(static_page)
  end

  scenario "Admin enters valid data" do
    new_title = "new_title"
    new_content = "new_content"

    fill_form(:static_page, :new, title: new_title, content: new_content)
    click_on "Submit"

    expect(page).to have_content(new_title)
    expect(page).to have_content(new_content)
  end
end
