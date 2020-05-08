require "rails_helper"

feature "Create Article" do
  let!(:user) { FactoryBot.create :user }
  let!(:company) { FactoryBot.create :company, owner: user }

  background do
    article = FactoryBot.create :article, :company, user: user, company: company
    visit edit_admin_scope_article_path(article)
  end
  scenario "Visitor tries to create new article" do
    expect(page).to have_content "You need to sign in"
  end
end
