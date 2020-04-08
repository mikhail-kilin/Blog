require "rails_helper"

feature "Sign Up" do
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }
  let(:registered_user) { User.find_by(email: user_attributes[:email]) }
  let(:company_attributes) { attributes_for(:company) }

  scenario "Visitor signs up" do
    visit new_user_registration_path

    fill_form(:user, user_attributes)
    click_button "Sign up"

    open_email(registered_user.email)

    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_body_text(registered_user.full_name)

    visit_in_email("Confirm my account")

    expect(page).to have_content("Your email address has been successfully confirmed")
    expect(User.first.full_name).to eq user_attributes[:full_name]
  end

  scenario "Visitor signs up and creates company with valid data" do
    visit new_user_registration_path

    fill_form(:user, user_attributes)
    fill_in :user_company_name, with: company_attributes[:name]
    fill_in :user_company_slug, with: company_attributes[:slug]
    click_button "Sign up"

    expect(Company.first.name).to eq company_attributes[:name]
    expect(Company.first.slug).to eq company_attributes[:slug]
  end

  scenario "Visitor signs up and creates company with invalid data" do
    visit new_user_registration_path

    Company.create company_attributes

    fill_form(:user, user_attributes)
    fill_in :user_company_name, with: company_attributes[:name]
    fill_in :user_company_slug, with: company_attributes[:slug]
    click_button "Sign up"

    expect(page).to have_content "Company not created, invalid name or slug"
  end
end
