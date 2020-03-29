require "rails_helper"

feature "Create Static Page" do
  include_context "current user signed in"

  let(:static_page) { FactoryBot.create :static_page }

  background do
    visit static_page_path(static_page)
  end

  scenario "Visitor looks at static_page" do
    expect(page).to have_content(static_page.title)
    expect(page).to have_content(static_page.content)
  end
end
