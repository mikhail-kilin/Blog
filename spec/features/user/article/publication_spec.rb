require "rails_helper"

feature "Publication of Article" do
  include_context "current user signed in"
  let!(:company) { FactoryBot.create :company, owner: current_user }
  let(:article) { FactoryBot.create :article, :company, user: current_user, company: company }

  scenario "Admin publicates article" do
    visit admin_scope_article_path article
    expect(page).to have_content("draft")

    click_on "Publicate"

    expect(page).to have_content("published")
  end

  scenario "Admin hides article" do
    article.update status: :published
    visit admin_scope_article_path article
    expect(page).to have_content("published")

    click_on "Hide"

    expect(page).to have_content("draft")
  end
end
