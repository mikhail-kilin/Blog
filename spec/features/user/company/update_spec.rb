require "rails_helper"

feature "Update Company" do
  include_context "current user signed in"

  background do
    company = FactoryBot.create :company
    visit edit_admin_scope_company_path(company)
  end

  scenario "Admin enters valid data" do
    new_name = "new name"
    new_slug = "new-name"

    fill_form(:company, :new, name: new_name, slug: new_slug)
    click_on "Submit"

    expect(page).to have_content(new_name)
  end
end
