require "rails_helper"

feature "Create Article" do
  include_context "current user signed in"

  let(:article_attrs) { attributes_for :article }

  background do
    create :company, owner: current_user
    visit new_admin_scope_article_path
  end

  scenario "Admin enters valid data" do
    fill_form(:article, article_attrs)
    select Company.first.name, from: :article_company_id

    click_on "Submit"

    expect(page).to have_content(article_attrs[:title])
    expect(page).to have_content(article_attrs[:content])
  end
end
