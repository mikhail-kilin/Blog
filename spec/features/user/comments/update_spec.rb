require "rails_helper"

feature "Update Comment" do
  include_context "current user signed in"
  let!(:company) { FactoryBot.create :company, owner: User.first }
  let!(:article) { FactoryBot.create :article, :company, user: User.first, company: company }

  background do
    FactoryBot.create :comment, user: User.first, article: article
  end

  scenario "Admin has access" do
    visit admin_scope_article_path(article)
    within ".buttons" do
      click_on "Edit"
    end

    text = "text2"
    fill_in :comment_content, with: text
    click_on "Submit"

    expect(page).to have_content(text)
  end

  scenario "Admin has not access" do
    user = FactoryBot.create :user
    login_as user
    visit admin_scope_article_path(article)

    expect(page).not_to have_content("Destroy")
  end

  scenario "Admin destroys comment" do
    visit admin_scope_article_path(article)
    click_on "Destroy"

    expect(page).not_to have_content("text")
  end
end