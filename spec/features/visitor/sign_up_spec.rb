require "rails_helper"

feature "Sign Up" do
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }
  let(:registered_user) { User.find_by(email: user_attributes[:email]) }
  let(:company_attributes) { attributes_for :company }

  scenario "Visitor signs up as author", js: true do
    company = FactoryBot.create :company
    visit new_user_registration_path

    choose :company_author
    fill_form(:user, user_attributes)
    select company.name, from: :user_company_ids
    click_button "Sign up"

    open_email(registered_user.email)

    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_body_text(registered_user.full_name)

    visit_in_email("Confirm my account")

    expect(page).to have_content("Your email address has been successfully confirmed")
  end

  scenario "Visitor signs up and creates company with valid data" do
    visit new_user_registration_path

    fill_form(:user, user_attributes)
    fill_in :user_own_company_attributes_name, with: company_attributes[:name]
    fill_in :user_own_company_attributes_slug, with: company_attributes[:slug]
    click_button "Sign up"

    visit admin_scope_company_path(company_attributes[:slug])

    expect(page).to have_content(company_attributes[:name])
  end

  scenario "Visitor signs up and creates company with invalid data" do
    visit new_user_registration_path

    Company.create company_attributes

    fill_form(:user, user_attributes)
    fill_in :user_own_company_attributes_name, with: company_attributes[:name]
    fill_in :user_own_company_attributes_slug, with: company_attributes[:slug]
    click_button "Sign up"

    expect(Company.all.count).to eq 1
  end

  scenario "Company shouldn`t be created if user enters invalid data" do
    visit new_user_registration_path

    fill_form(:user, user_attributes)
    fill_in :user_password_confirmation, with: "invalid password"

    fill_in :user_own_company_attributes_name, with: company_attributes[:name]
    fill_in :user_own_company_attributes_slug, with: company_attributes[:slug]
    click_button "Sign up"

    expect(page).to have_content "User could not be created."

    visit companies_path

    expect(page).not_to have_content(company_attributes[:name])
  end
end
