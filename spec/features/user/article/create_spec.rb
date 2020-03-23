require "rails_helper"

feature "Create Article" do
  include_context "current user signed in"

  let(:article_attrs) { attributes_for :article }

  background do
    visit new_admin_scope_article_path
  end

  scenario "Admin enters valid data" do
    fill_form(:article, article_attrs)
    click_on "Submit"

    expect(page).to have_content(article_attrs[:title])
    expect(page).to have_content(article_attrs[:content])
  end
end
