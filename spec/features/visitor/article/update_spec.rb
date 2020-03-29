require "rails_helper"

feature "Create Article" do
  background do
    article = FactoryBot.create :article
    FactoryBot.create :user
    visit edit_admin_scope_article_path(article)
  end
  scenario "Visitor tries to create new article" do
    expect(page).to have_content "You need to sign in"
  end
end
