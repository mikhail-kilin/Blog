require "rails_helper"

feature "Update Company" do
  include_context "current user signed in"

  let!(:user) { FactoryBot.create :user }
  let(:company) { FactoryBot.create :company, owner: user }

  background do
    visit company_path(company)
  end

  scenario "Admin enters valid data" do
    click_on "I want to be an author"

    expect(page).to have_content("Now you became an author")
    expect(page).not_to have_content("I want to be an author")
    expect(page).to have_content("Now you became an author")
  end
end
