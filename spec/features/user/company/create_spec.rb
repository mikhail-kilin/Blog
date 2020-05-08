require "rails_helper"

feature "Create Company" do
  include_context "current user signed in"

  let(:company_attrs) { attributes_for(:company, owner: User.first).except :owner }

  scenario "Admin enters valid data" do
    visit new_admin_scope_company_path
    fill_form(:company, company_attrs)
    click_on "Submit"

    expect(page).to have_content(company_attrs[:name])
  end

  scenario "Admin tryes to create second company" do
    company = FactoryBot.create :company, owner: User.first
    visit new_admin_scope_company_path
    expect(page).to have_content(company.name)
  end
end
