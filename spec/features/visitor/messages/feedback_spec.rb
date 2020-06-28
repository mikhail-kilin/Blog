require "rails_helper"

feature "As Visitor I want to leave feedback" do
  let(:name) { Faker::Name.name }
  let(:email) { Faker::Internet.email }
  let(:content) { Faker::Lorem.paragraph }
  let(:user) { create :user }
  let(:company) { create :company, owner: user }

  background do
    visit new_company_message_path(company)
  end

  scenario "When I open New Feedback page" do
    expect(page).to have_content "Name"
    expect(page).to have_content "Email"
    expect(page).to have_content "Content"
  end

  scenario "When I fill all 3 fields and When I click 'Submit feedback'" do
    fill_in :message_name, with: name
    fill_in :message_email, with: email
    fill_in :message_content, with: content

    click_on "Submit"

    expect(page).to have_content "Feedback was successfully sent!"
    expect(ActionMailer::Base.deliveries.first.to.first).to eq user.email
  end

  scenario "I enter empty data" do
    click_on "Submit"
    expect(page).to have_content "Invalid data!"
  end
end
