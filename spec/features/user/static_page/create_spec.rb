require "rails_helper"

feature "Create Static Page" do
  include_context "current user signed in"

  let(:static_page_attrs) { attributes_for :static_page }

  background do
    visit new_admin_scope_static_page_path
  end

  scenario "Admin enters valid data" do
    fill_form(:static_page, static_page_attrs)
    click_on "Submit"

    expect(page).to have_content(static_page_attrs[:title])
    expect(page).to have_content(static_page_attrs[:content])
  end
end
