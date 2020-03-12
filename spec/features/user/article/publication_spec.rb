require "rails_helper"

feature "Publication of Article" do
  include_context "current user signed in"

  let(:article) { FactoryBot.create :article }

  scenario "Admin publicates article" do
    visit article_path article
    expect(page).to have_content("draft")

    click_on "Publicate"

    expect(page).to have_content("published")
  end

  scenario "Admin hides article" do
    article.update status: :published
    visit article_path article
    expect(page).to have_content("published")

    click_on "Hide"

    expect(page).to have_content("draft")
  end
end
