require "rails_helper"

feature "Create Company" do
  include_context "current user signed in"

  let(:company_attrs) { attributes_for :company }

  background do
    visit new_admin_scope_company_path
  end

  scenario "Admin enters valid data" do
    fill_form(:company, company_attrs)
    click_on "Submit"

    expect(page).to have_content(company_attrs[:name])
  end
end
